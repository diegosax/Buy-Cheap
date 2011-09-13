class AddCustomerIdToBigOrder < ActiveRecord::Migration
  def self.up
    add_column :big_orders, :customer_id, :integer
  end

  def self.down
    remove_column :big_orders, :customer_id
  end
end
