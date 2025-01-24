class AddColumnToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :color_id, :string
  end
end
