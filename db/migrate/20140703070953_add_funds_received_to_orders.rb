class AddFundsReceivedToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :funds_received, :decimal, precision: 32, scale: 16, default: 0
  end
end
