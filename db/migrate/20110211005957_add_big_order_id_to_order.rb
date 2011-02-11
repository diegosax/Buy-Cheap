class AddBigOrderIdToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :big_order_id, :integer
  end

  def self.down
    remove_column :orders, :big_order_id
  end
end
