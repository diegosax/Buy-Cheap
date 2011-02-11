class AddCustomerFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :document, :string
    add_column :users, :telephone, :string
    add_column :users, :celphone, :string
    add_column :users, :birthdate, :date
    add_column :users, :sex, :string
  end

  def self.down
    remove_column :users, :sex
    remove_column :users, :birthdate
    remove_column :users, :celphone
    remove_column :users, :telephone
    remove_column :users, :document
    remove_column :users, :name
  end
end
