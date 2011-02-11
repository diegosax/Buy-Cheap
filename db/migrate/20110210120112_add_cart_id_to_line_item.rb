class AddCartIdToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :cart_id, :integer
  end

  def self.down
    remove_column :line_items, :cart_id
  end
end
