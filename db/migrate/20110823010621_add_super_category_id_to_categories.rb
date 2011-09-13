class AddSuperCategoryIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :super_category_id, :integer
  end

  def self.down
    remove_column :categories, :super_category_id
  end
end
