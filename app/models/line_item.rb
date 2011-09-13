class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  #before_filter :verifica_stock?
  
  #metodo para calcular o preco total de um item
  def total_price
    product.price * quantity
  end

  #Metodo para Verificar Disponibilidade em STOCK
  def verifica_stock?
    puts "CHAMOU O METODO VERIFICA STOCK"
    if quantity > product.stock
      puts "Quantidade insuficiente em STOCK"
      return false
    end
    return true
  end
end

