class Product < ActiveRecord::Base
  has_many :line_items, :dependent => :delete_all
  has_many :orders, :through => :line_items
  belongs_to :company
  belongs_to :category

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name, :presence => true
  validates :short_description, :presence => true
  validates :description, :presence => true
  validates :stock, :presence => true, :numericality => true
  validates :original_price, :numericality => true
  validates :price, :numericality => true
  validates :name, :uniqueness => true
  scope :available, where("available_on <= ?", DateTime.now )
  mount_uploader :image, ImageUploader
  #UPLOAD DE IMAGENS
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  #UPLOAD DE IMAGENS
  #attr_accessor :image_file_name

 

  def self.search(category = nil, discount = nil, query = nil)
    discount = discount.to_i
    discount = 20 if discount == nil || discount < 20 || discount >=100
    if category
      where("(1 - price/original_price) * 100 >= ? and category_id = ?",discount, category)
    else
      where("(1 - price/original_price) * 100 >= ? ",discount)
    end

  end

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      true
    else
      puts "ERRO LINE ITEM EXISTENTE"
      errors[:base] << "Line Item Existente!"
      false
    end
  end

  def update_stock(qtd)
    stock -= qtd
  end



end
