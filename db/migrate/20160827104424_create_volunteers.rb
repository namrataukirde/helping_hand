class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.integer :age
      t.boolean :gender
      t.integer :qualification

      t.timestamps
    end
  end
end
