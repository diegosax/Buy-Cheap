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
  scope :latest, order("created_at DESC").limit(10)
  scope :greatest, order("((1 - price/original_price) * 100) DESC").limit(12)
  mount_uploader :image, ImageUploader
  #UPLOAD DE IMAGENS
  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  #UPLOAD DE IMAGENS
  #attr_accessor :image_file_name

  acts_as_taggable

  define_index do
    indexes :name, :sortable => true
    indexes short_description
    indexes description      
    indexes category.name, :as => :category_name
    indexes company.name, :as => :company_name

    #indexes tags.name, :as => :tag_name, :facet => true
    
    #TODO: add the where filter: where "status = 'active'"        

    has company_id, category_id, updated_at, created_at, :facet => true

    set_property :field_weights => {
      :name => 10,
      :company_name => 9,
      :short_description  => 8,
      :tag_name => 7,
      :description => 3
    }
  end  


#  def self.search(category = nil, discount = nil, query = nil)
#    discount = discount.to_i
#    discount = 20 if discount == nil || discount < 20 || discount >=100
#    if category
#      where("(1 - price/original_price) * 100 >= ? and category_id = ?",discount, category)
#    else
#      where("(1 - price/original_price) * 100 >= ? ",discount)
#    end
#
#  end

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
