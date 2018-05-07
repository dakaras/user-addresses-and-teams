class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :cross_street
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :user_id
      t.string :address_type
      t.timestamps null: false
    end
  end
end
