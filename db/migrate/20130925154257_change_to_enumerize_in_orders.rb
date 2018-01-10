class ChangeToEnumerizeInOrders < ActiveRecord::Migration[4.2]
  def up
    change_column :orders, :bid, "integer USING bid::integer"
    change_column :orders, :ask, "integer USING ask::integer"
    change_column :orders, :state, "integer USING state::integer"
    change_column :orders, :currency, "integer USING currency::integer"
    change_column :orders, :type, :string, :limit => 8
  end

  def down
    change_column :orders, :bid, :string
    change_column :orders, :ask, :string
    change_column :orders, :state, :string
    change_column :orders, :currency, :string
    change_column :orders, :type, :string, :limit => nil
  end
end
