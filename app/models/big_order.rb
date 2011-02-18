class BigOrder < ActiveRecord::Base
  has_many :orders
  belongs_to :customer

  def total_price
    total = 0
    orders.each do |order|
      order.line_items.each do |item|
        total+=item.total_price
      end
    end
    puts "VALOR TOTAL: #{total}"
    total
  end


end
