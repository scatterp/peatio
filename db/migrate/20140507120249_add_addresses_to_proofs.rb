class AddAddressesToProofs < ActiveRecord::Migration[4.2]
  def change
    add_column :proofs, :addresses, :text
  end
end
