class RemoveCityIdAndStateIdFromAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :city_id
    remove_column :addresses, :state_id
  end

  def self.down
    add_column :addresses, :state_id, :integer
    add_column :addresses, :city_id, :integer
  end
end
