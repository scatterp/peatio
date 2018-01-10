class AddUsedFundsToTrades < ActiveRecord::Migration[4.2]
  def change
    add_column :trades, :funds, :decimal, precision: 32, scale: 16
  end
end
