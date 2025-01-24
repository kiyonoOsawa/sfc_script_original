class AddColumn < ActiveRecord::Migration[7.2]
  def change
    add_column :colors, :display_name, :string
  end
end
