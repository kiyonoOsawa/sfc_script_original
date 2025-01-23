class EditTaskTable < ActiveRecord::Migration[7.2]
  def change
    remove_column :tasks, :usder_id, :integer
    add_column :tasks, :user_id, :integer
  end
end
