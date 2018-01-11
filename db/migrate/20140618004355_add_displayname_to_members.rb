class AddDisplaynameToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :display_name, :string, after: :name
    add_index :members, :display_name, unique: true
  end
end
