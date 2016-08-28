class AddNameToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :name, :string
  end
end
