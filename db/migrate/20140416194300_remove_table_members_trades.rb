class RemoveTableMembersTrades < ActiveRecord::Migration[4.2]
  def change
    drop_table :members_trades
  end
end
