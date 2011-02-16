class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :user_id
      t.string :number
      t.integer :item_qtd
      t.float :total
      t.text :instructions
      t.string :status, :default => "Incompleto"

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
