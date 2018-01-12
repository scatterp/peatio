class AddReceiveAtToPaymentTransactions < ActiveRecord::Migration[4.2]
  def change
    add_column :payment_transactions, :receive_at, :datetime
  end
end
