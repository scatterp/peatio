class CreateDeposits < ActiveRecord::Migration[4.2]
  def change
    create_table :deposits do |t|
      t.integer :account_id
      t.decimal :amount, :precision => 32, :scale => 16
      t.string :payment_way
      t.string :payment_id
      t.string :state

      t.timestamps
    end
  end
end
