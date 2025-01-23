class CreateTeamUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :team_users do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
