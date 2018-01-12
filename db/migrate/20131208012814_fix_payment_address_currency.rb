class FixPaymentAddressCurrency < ActiveRecord::Migration[4.2]
  def change
    add_column :payment_addresses, :currency, :integer
  end
end
