class AddPaymentTransactionIdToDeposits < ActiveRecord::Migration[4.2]
  def change
    add_column :deposits, :payment_transaction_id, :integer
  end
end
