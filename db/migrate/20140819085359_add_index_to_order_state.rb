class AddIndexToOrderState < ActiveRecord::Migration[4.2]
  def change
    add_index :orders, :state
  end
end
