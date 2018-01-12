class AddCurrencyToPaymentTransactions < ActiveRecord::Migration[4.2]
  def change
    add_column :payment_transactions, :currency, :integer
  end
end

