class AddBairroToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :bairro, :string
  end

  def self.down
    remove_column :addresses, :bairro
  end
end
