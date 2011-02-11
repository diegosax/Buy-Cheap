class AddCompanyFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :razao_social, :string
    add_column :users, :verified, :boolean
    add_column :users, :area, :string
  end

  def self.down
    remove_column :users, :area
    remove_column :users, :verified
    remove_column :users, :razao_social
  end
end
