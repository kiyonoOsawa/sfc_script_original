class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :taskName
      t.datetime :tryDay
      t.datetime :deadDay
      t.integer :usder_id

      t.timestamps
    end
  end
end
