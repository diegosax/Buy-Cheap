class AddFieldsToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :ip_address, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :card_type, :string
    add_column :orders, :card_expires_on, :date
  end

  def self.down
    remove_column :orders, :card_expires_on
    remove_column :orders, :card_type
    remove_column :orders, :last_name
    remove_column :orders, :first_name
    remove_column :orders, :ip_address
  end
end
