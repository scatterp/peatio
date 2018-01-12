class AddTxOutToPaymentTransactions < ActiveRecord::Migration[4.2]
  def change
    add_column :payment_transactions, :txout, :integer
    add_index :payment_transactions, [:txid, :txout]
  end
end
