class AddPaymentIdToWithdraws < ActiveRecord::Migration[4.2]
  def change
    add_column :withdraws, :payment_id, :string
  end
end
