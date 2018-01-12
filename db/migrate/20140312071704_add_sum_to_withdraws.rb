class AddSumToWithdraws < ActiveRecord::Migration[4.2]
  def change
    add_column :withdraws, :sum, :decimal, precision: 32, scale: 16
  end
end
