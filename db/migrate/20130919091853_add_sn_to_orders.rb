class AddSnToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :sn, :string
  end
end
