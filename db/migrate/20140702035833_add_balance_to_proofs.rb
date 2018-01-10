class AddBalanceToProofs < ActiveRecord::Migration[4.2]
  def change
    add_column :proofs, :balance, :string, limit: 30
  end
end
