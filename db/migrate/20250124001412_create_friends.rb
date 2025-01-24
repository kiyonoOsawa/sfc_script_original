class CreateFriends < ActiveRecord::Migration[7.2]
  def change
    create_table :friends do |t|
      t.timestamps
    end
  end
end
