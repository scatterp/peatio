class ChangeToEnumerizeInWithdraws < ActiveRecord::Migration
  def up
    change_column :withdraws, :payment_way, "integer USING payment_way::integer"
    change_column :withdraws, :state, "integer USING state::integer"
  end

  def down
    change_column :withdraws, :payment_way, :string
    change_column :withdraws, :state, :string
  end
end
