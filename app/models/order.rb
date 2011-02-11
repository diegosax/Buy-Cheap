class Order < ActiveRecord::Base
  belongs_to :company
  belongs_to :customer
  belongs_to :big_order
  #:dependent => :destroy indica que ao apagar uma order todos seus line_items tambem serao apagados
  has_many :line_items, :dependent => :destroy
  has_many :products, :through => :line_items

  #Metodo para adicionar os items que estao no carrinho ao pedido
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
        item.cart_id = nil
        line_items << item
    end
  end

end
