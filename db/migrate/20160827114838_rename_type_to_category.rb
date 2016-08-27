class RenameTypeToCategory < ActiveRecord::Migration[5.0]
  def change
  	rename_column :items, :type, :category
  	rename_column :ngos, :type, :category
  end
end
