class RenameQualificationToOccupation < ActiveRecord::Migration[5.0]
  def change
    rename_column :volunteers, :qualification, :occupation
  end
end
