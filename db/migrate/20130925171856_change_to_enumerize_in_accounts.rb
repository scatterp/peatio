class ChangeToEnumerizeInAccounts < ActiveRecord::Migration[4.2]
  def up
    change_column :accounts, :currency, "integer USING currency::integer"
  end

  def down
    change_column :accounts, :currency, :string
  end
end
