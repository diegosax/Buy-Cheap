class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :customer
  accepts_nested_attributes_for :line_items


  def clear_line_items
    puts "TESTANDO O BEFORE DESTROY METODO::::"
    line_items.each do |item|
      item.cart_id = nil
    end
    puts line_items.inspect
  end

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
