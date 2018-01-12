class AddDefaultWithdrawFundSourceIdToAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :default_withdraw_fund_source_id, :integer
  end
end
