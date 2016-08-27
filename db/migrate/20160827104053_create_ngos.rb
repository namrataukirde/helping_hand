class CreateNgos < ActiveRecord::Migration[5.0]
  def change
    create_table :ngos do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :address_id

      t.timestamps
    end
  end
end
