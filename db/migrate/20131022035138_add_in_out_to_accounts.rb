class AddInOutToAccounts < ActiveRecord::Migration[4.2]
  def change
    add_column :accounts, :in, :decimal, :precision => 32, :scale => 16
    add_column :accounts, :out, :decimal, :precision => 32, :scale => 16
  end
end
