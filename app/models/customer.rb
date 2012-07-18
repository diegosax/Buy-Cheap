class Customer < User
  has_many :addresses
  has_many :big_orders
  has_many :orders
  has_one :cart
  before_create :format_telephone
  before_create :format_celphone

  #usar_como_cpf :document

  def shipping_address
    address = self.addresses.where(:preferred => true).first
    if address.nil?
      address = self.addresses.first
    end
    address
  end

end
