class AddCityAndStateToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
  end

  def self.down
    remove_column :addresses, :state
    remove_column :addresses, :city
  end
end
