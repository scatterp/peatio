class MigrateWithdrawAddresses < ActiveRecord::Migration[4.2]
  def up
    change_table :members do |t|
      t.remove :alipay
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
