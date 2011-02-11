class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :complement
      t.integer :city_id
      t.integer :state_id
      t.string :zipcode
      t.string :phone
      t.string :cel_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
