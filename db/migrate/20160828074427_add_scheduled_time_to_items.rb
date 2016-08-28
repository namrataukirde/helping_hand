class AddScheduledTimeToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :scheduled_time, :datetime
  end
end
