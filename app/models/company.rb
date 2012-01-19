class Company < User
  has_many :orders
  has_many :products
  has_many :addresses , :foreign_key => :customer_id
  
  validates_presence_of :document, :razao_social, :name
  #validates_uniqueness_of :document, :razao_social
  #usar_como_cnpj :document
  
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  mount_uploader :image, ImageUploader

  def available_offers
    self.products.available.count
  end
end
