class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :donor_id
      t.string :state
      t.integer :type
      t.integer :quantity
      t.string :description
      t.integer :receiver_id

      t.timestamps
    end
  end
end
