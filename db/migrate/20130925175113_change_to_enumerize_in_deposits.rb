class ChangeToEnumerizeInDeposits < ActiveRecord::Migration
  def up
    change_column :deposits, :payment_way, "integer USING payment_way::integer"
    change_column :deposits, :state, "integer USING state::integer"
  end

  def down
    change_column :deposits, :payment_way, :string
    change_column :deposits, :state, :string
  end
end
