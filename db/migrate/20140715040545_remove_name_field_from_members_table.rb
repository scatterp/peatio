class RemoveNameFieldFromMembersTable < ActiveRecord::Migration[4.2]
  def up
    remove_column :members, :name
  end

  def down
    add_column :members, :name, :string
  end
end
