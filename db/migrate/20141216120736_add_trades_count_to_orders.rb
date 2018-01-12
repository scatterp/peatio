class AddTradesCountToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :trades_count, :integer, default: 0
  end
end
