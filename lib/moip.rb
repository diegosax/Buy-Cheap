require 'httparty'
require 'builder'

class Moip
  include HTTParty

  puts "ANALISANDO: "
  puts Rails.env
  CONFIG = YAML.load_file(File.join(RAILS_ROOT, 'config', 'gateway.yml'))[Rails.env]
  STATUS = {1=>"Autorizado", 2=>"Iniciado", 3=>"Boleto Impresso", 4=>"Concluido", 5=>"Cancelado", 6=>"Em analise",7=>"Estornado"}

  base_uri "#{CONFIG["uri"]}/ws/alpha"
  basic_auth CONFIG["token"], CONFIG["key"]

  class << self
    def authorize(order,current_user)
      xml = mount_request(order,current_user)
      puts "TEM QUE PARAR AQUI"
      response = post('/EnviarInstrucao/Unica', :body => xml)
      puts "PASSOU"

      raise(StandardError, "Webservice can't be reached") if response.nil?
      puts "Exibindo o valor do response: #{response.inspect}"
      response = response["ns1:EnviarInstrucaoUnicaResponse"]["Resposta"]
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

  protected
    # você pode adicionar mais campos da API do MoIP aqui a medida que seus
    # exemplos forem se tornando mais complexos.
    def mount_request(order,current_user)
      #reason, id, value = attributes[:reason], attributes[:id], attributes[:value]

      endereco = order.address

      puts endereco.address
      moeda = "BRL"
      xml = Builder::XmlMarkup.new.EnviarInstrucao do |e|
        e.InstrucaoUnica do |i|
          i.Razao "BuyCheap - Numero do Pedido: #{order.id}"
          i.IdProprio order.id
          i.URLRetorno "https://buycheap.heroku.com/orders/summary?req=#{order.id}"
          i.Valores {|v| v.Valor(order.total_price, :moeda=>moeda)}
#          i.FormasPagamento { |p|
#            p.FormaPagamento "CartaoCredito"
#            p.FormaPagamento "BoletoBancario"
#            p.FormaPagamento "DebitoBancario"
#          }
          i.Pagador{ |p|
            p.Nome current_user.name
            p.Email current_user.email
              p.TelefoneCelular current_user.celphone
            p.EnderecoCobranca { |e|
              e.Logradouro endereco.address unless !endereco
              e.Numero endereco.number
              e.Complemento endereco.complement unless !endereco
              e.CEP endereco.zipcode unless !endereco
              e.Bairro endereco.bairro unless !endereco
              e.Cidade endereco.city unless !endereco
              e.Estado endereco.state unless !endereco
              e.TelefoneFixo current_user.telephone unless !endereco
            }
          }

        end
      end
      puts xml.inspect
      xml
    end
  end

end

