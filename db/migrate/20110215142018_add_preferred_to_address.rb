class AddPreferredToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :preferred, :boolean
  end

  def self.down
    remove_column :addresses, :preferred
  end
end
