class AddOrdTypeToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :ord_type, :string, limit: 10
  end
end
