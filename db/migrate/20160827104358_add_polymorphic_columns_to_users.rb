class AddPolymorphicColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :detail_type, :string
    add_column :users, :detail_id, :integer

    add_index :users, [:detail_type, :detail_id]
  end
end
