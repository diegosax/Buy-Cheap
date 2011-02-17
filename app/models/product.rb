class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  belongs_to :company
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name, :presence => true
  validates :short_description, :presence => true
  validates :description, :presence => true
  validates :stock, :presence => true, :numericality => true
  validates :original_price, :numericality => true
  validates :price, :numericality => true
  

  def ensure_not_referenced_by_any_line_item
    if line_items.count.zero?
      return true
    else
      puts "ERRO LINE ITEM EXISTENTE"
      errors[:base] << "Line Item Existente!"
      return false
    end
  end
end
