# == Schema Information
#
# Table name: payment_transactions
#
#  id            :integer          not null, primary key
#  txid          :string
#  amount        :decimal(32, 16)
#  confirmations :integer
#  address       :string
#  state         :integer
#  created_at    :datetime
#  updated_at    :datetime
#  receive_at    :datetime
#  dont_at       :datetime
#  currency      :integer
#  aasm_state    :string
#  type          :string(60)
#  txout         :integer
#
# Indexes
#
#  index_payment_transactions_on_txid_and_txout  (txid,txout)
#  index_payment_transactions_on_type            (type)
#

class PaymentTransaction::Normal < PaymentTransaction
  # Default payment transaction captures all bitcoin-like transactions.

  validates_presence_of :txout
  validates_uniqueness_of :txout, scope: :txid

end
