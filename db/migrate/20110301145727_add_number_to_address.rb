class AddNumberToAddress < ActiveRecord::Migration
  def self.up
    add_column :addresses, :number, :string
  end

  def self.down
    remove_column :addresses, :number
  end
end
