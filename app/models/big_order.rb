class BigOrder < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  belongs_to :customer
  belongs_to :address

  attr_writer :current_step


  def current_step
    @current_step || steps.first
  end

  def steps
    %w[identification shipping payment]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def last_step?
    current_step == steps.last
  end

  def first_step?
    current_step == steps.first
  end

  def total_price
    total = 0
    orders.each do |order|
      order.line_items.each do |item|
        total+=item.total_price
      end
    end
    total
  end

  def create_orders_from_cart(cart)

    companies = []
    cart.line_items.each do |item|
      if !companies.include?(item.product.company)
        companies << item.product.company
      end
    end
    companies.each do |company|
      order = self.orders.build
      order.company = company
      order.customer = self.customer
      order.address_id = self.address_id
      cart.line_items.each do |item|
        if item.product.company.name == company.name
          order.line_items << item
        end
      end
      order.item_qtd = order.line_items.count
      order.total = order.total_price
    end
  end
end
