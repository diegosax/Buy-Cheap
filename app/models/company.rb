class Company < User
  has_many :orders
  has_many :products
end
