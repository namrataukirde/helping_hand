class AddContactToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :contact_number, :integer 
  end
end
