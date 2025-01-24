class EditFriendTable < ActiveRecord::Migration[7.2]
  def change
    add_column :friends, :user_id, :integer
    add_column :friends, :friend_id, :integer
  end
end
