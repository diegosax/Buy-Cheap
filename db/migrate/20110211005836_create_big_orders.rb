class CreateBigOrders < ActiveRecord::Migration
  def self.up
    create_table :big_orders do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :big_orders
  end
end
