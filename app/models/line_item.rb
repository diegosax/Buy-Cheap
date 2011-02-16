class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order
 
  #metodo para calcular o preco total de um item
  def total_price
    product.price * quantity
  end
end
