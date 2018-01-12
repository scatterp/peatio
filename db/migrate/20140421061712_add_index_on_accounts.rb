class AddIndexOnAccounts < ActiveRecord::Migration[4.2]
  def change
    add_index :accounts, [:member_id, :currency]
    add_index :accounts, :member_id
  end
end
