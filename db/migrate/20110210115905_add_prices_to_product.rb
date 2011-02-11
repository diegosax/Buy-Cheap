class AddPricesToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :original_price, :float
    add_column :products, :price, :float
  end

  def self.down
    remove_column :products, :price
    remove_column :products, :original_price
  end
end
