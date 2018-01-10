class AddDeletedAtToWithdrawAddresses < ActiveRecord::Migration[4.2]
  def change
    add_column :withdraw_addresses, :deleted_at, :datetime
  end
end
