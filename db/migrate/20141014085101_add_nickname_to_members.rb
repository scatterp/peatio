class AddNicknameToMembers < ActiveRecord::Migration[4.2]
  def change
    add_column :members, :nickname, :string
  end
end
