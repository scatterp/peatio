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

FactoryBot.define do
  factory :payment_transaction do
    txid { Faker::Lorem.characters(16) }
    txout 0
    currency { 'btc' }
    amount { 10.to_d }
    payment_address
  end
end
