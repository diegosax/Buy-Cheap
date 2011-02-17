class RemoveFieldsFromOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :number
    remove_column :orders, :instructions
    remove_column :orders, :first_name
    remove_column :orders, :last_name
    remove_column :orders, :card_type
    remove_column :orders, :card_expires_on
    remove_column :orders, :item_qtd
  end

  def self.down
    add_column :orders, :item_qtd, :integer
    add_column :orders, :card_expires_on, :date
    add_column :orders, :card_type, :string
    add_column :orders, :last_name, :string
    add_column :orders, :first_name, :string
    add_column :orders, :instructions, :string
    add_column :orders, :number, :string
  end
end
