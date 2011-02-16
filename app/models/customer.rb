class Customer < User
  has_many :addresses
  has_many :big_orders
  has_one :cart
  accepts_nested_attributes_for :addresses
end
