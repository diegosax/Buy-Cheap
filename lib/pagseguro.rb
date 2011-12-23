require 'httparty'
require 'builder'

class Pagseguro
  include HTTParty

  puts "ANALISANDO: "
  puts Rails.env
  CONFIG = YAML.load_file(File.join(RAILS_ROOT, 'config', 'gateway.yml'))[Rails.env]
  STATUS = {1=>"Autorizado", 2=>"Iniciado", 3=>"Boleto Impresso", 4=>"Concluido", 5=>"Cancelado", 6=>"Em analise",7=>"Estornado"}

  base_uri "#{CONFIG["uri"]}/v2"
  basic_auth CONFIG["email"], CONFIG["authenticity_token"]

  class << self
    def authorize(order,current_user)
      xml = mount_request(order,current_user)
      response = post('/checkout', :body => xml)
      raise(StandardError, "Webservice can't be reached") if response.nil?
      #response = response["ns1:EnviarInstrucaoUnicaResponse"]["Resposta"]
      puts "Resposta DO PAGSEGURO:: #{response.inspect}"
      raise(StandardError, response["Erro"]) if response["Status"] == "Falha"
      response
    end

    def charge_url(token)
      "#{CONFIG["uri"]}/Instrucao.do?token=#{token}"
    end

    def notification(params)
      notification = {}
      notification[:transaction_id] = params["id_transacao"]
      notification[:amount]         = sprintf("%.2f", params["valor"].to_f / 100).to_d
      notification[:status]         = STATUS[params["status_pagamento"].to_i]
      notification[:code]           = params["cod_moip"]
      notification[:payment_type]   = params["tipo_pagamento"]
      notification[:email]          = params["email_consumidor"]
      notification
    end


    # você pode adicionar mais campos da API do MoIP aqui a medida que seus
    # exemplos forem se tornando mais complexos. 
    def mount_request(order,current_user)
      #reason, id, value = attributes[:reason], attributes[:id], attributes[:value]

      endereco = order.address

      puts endereco.address
      moeda = "BRL"
      xml = Builder::XmlMarkup.new.EnviarInstrucao do |e|
        e.checkout do |i|
          i.currency moeda
          i.IdProprio order.id
          i.items do |item|
            order.line_items.each do |line_item|
              item.id line_item.product.id
              item.description line_item.product.name
              item.amount line_item.product.price
              item.quantity line_item.quantity
            end
          end
          i.reference order.id
          i.sender{ |p|
            p.name current_user.name
            p.email current_user.email
            p.phone do |phone|
              phone.areaCode current_user.telephone.slice(1..2)
              phone.number current_user.telephone.slice(4..7) + current_user.telephone.slice(9..12)
            end

            p.shipping { |a|
              if endereco
                a.address{ |e|
                  e.street endereco.address
                  e.number endereco.number
                  e.complement endereco.complement
                  e.postalCode endereco.zipcode
                  e.district endereco.bairro
                  e.city endereco.city
                  e.state endereco.state
                  e.country "BRA"
                }
              end
            }
          }
        end
      end
      puts xml.inspect
      xml
    end
  end

end
