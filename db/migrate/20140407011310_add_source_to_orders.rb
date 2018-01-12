class AddSourceToOrders < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :source, :string, null: false
    Order.update_all(source: 'Web')
  end
end
