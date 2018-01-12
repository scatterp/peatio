class AddIndexToTrades < ActiveRecord::Migration[4.2]
  def change
    add_index :trades, :created_at, using: :btree
  end
end
