class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end

    add_index :addresses, [:resource_id, :resource_type]
  end
end
