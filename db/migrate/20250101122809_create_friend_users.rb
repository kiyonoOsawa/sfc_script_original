class CreateFriendUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :friend_users do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
