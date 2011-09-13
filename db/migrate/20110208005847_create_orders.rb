class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :company_id
      t.integer :item_qtd
      t.float :total
      t.integer :address_id
      t.string :status, :default => "Incompleto"

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
