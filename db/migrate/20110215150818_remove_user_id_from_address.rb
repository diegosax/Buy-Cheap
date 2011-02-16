class RemoveUserIdFromAddress < ActiveRecord::Migration
  def self.up
    remove_column :addresses, :user_id
  end

  def self.down
    add_column :addresses, :user_id, :integer
  end
end
