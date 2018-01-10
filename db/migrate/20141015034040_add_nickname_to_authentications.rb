class AddNicknameToAuthentications < ActiveRecord::Migration[4.2]
  def change
    add_column :authentications, :nickname, :string
  end
end
