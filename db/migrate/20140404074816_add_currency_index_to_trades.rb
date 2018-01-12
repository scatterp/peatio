class AddCurrencyIndexToTrades < ActiveRecord::Migration[4.2]
  def change
    add_index :trades, :currency
  end
end
