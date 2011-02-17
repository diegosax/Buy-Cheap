class DropCategoriesProductsTable < ActiveRecord::Migration
  def self.up
    drop_table :categories_products
  end

  def self.down
    create_table :categories_products do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
