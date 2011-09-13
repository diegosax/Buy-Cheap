class AddAddressIdToBigOrder < ActiveRecord::Migration
  def self.up
    add_column :big_orders, :address_id, :integer
  end

  def self.down
    remove_column :big_orders, :address_id
  end
end
