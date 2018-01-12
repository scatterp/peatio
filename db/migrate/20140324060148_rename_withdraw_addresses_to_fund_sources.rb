class RenameWithdrawAddressesToFundSources < ActiveRecord::Migration[4.2]
  def change
    rename_table :withdraw_addresses, :fund_sources
  end
end
