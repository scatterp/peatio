class AddTxoutToDeposits < ActiveRecord::Migration[4.2]
  def change
    add_column :deposits, :txout, :integer
    add_index :deposits, [:txid, :txout]
  end
end
