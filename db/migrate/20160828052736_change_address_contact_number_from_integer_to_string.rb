class ChangeAddressContactNumberFromIntegerToString < ActiveRecord::Migration[5.0]
  def change
    change_column :addresses, :contact_number, :string
  end
end
