class AddIndexToOrders < ActiveRecord::Migration[4.2]
  def change
    add_index :orders, :member_id, using: :btree
    add_index :orders, [:currency, :state], using: :btree
  end
end
