class Category < ActiveRecord::Base
  has_many :sub_categories, :class_name => "Category", :foreign_key => :super_category_id
  belongs_to :super_category, :class_name => "Category"
  has_many :products
  scope :super_categories, where(:super_category_id => nil)
end
