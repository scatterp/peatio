class AddBalanceToAccountVersions < ActiveRecord::Migration[4.2]
  def change
    add_column :account_versions, :balance, :decimal, :precision => 32, :scale => 16
    add_column :account_versions, :amount, :decimal, :precision => 32, :scale => 16
  end
end
