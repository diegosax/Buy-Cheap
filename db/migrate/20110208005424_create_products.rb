class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :short_description
      t.text :description
      t.float :original_price
      t.float :price
      t.datetime :available_on
      t.datetime :deleted_at
      t.integer :category_id
      t.integer :company_id
      t.boolean :shippable
      t.integer :stock

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
