class AddColumnStartTime < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :start_time, :datetime
    remove_column :tasks, :deadDay, :datetime
    remove_column :tasks, :tryDay, :datetime
  end
end
