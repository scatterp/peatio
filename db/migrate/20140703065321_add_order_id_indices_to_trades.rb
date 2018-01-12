class AddOrderIdIndicesToTrades < ActiveRecord::Migration[4.2]
  def change
    add_index :trades, :ask_id
    add_index :trades, :bid_id
  end
end
