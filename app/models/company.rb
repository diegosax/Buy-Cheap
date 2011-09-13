class Company < User
  has_many :orders
  has_many :products
  belongs_to :address
  #usar_como_cnpj :document
  mount_uploader :image, ImageUploader

  def available_offers
    self.products.available.count
  end
end
