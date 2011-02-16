class AddShippingAddressIdToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :shipping_address_id, :integer
  end

  def self.down
    remove_column :orders, :shipping_address_id
  end
end
