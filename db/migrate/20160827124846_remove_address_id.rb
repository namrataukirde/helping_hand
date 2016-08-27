class RemoveAddressId < ActiveRecord::Migration[5.0]
  def change
    remove_column :ngos, :address_id
  end
end
