class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :customer

  #Metodo para adicionar um produto em um carrinho
  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    puts current_item.inspect
    if current_item
      current_item.quantity += 1
    else
      current_item = LineItem.new(:product_id => product_id)
      line_items << current_item
    end
    current_item
  end

  #Calcular o preco total do carrinho
  def total_price
    line_items.to_a.sum{ |item| item.total_price}
  end

end
