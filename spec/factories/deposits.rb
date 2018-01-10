# == Schema Information
#
# Table name: deposits
#
#  id                     :integer          not null, primary key
#  account_id             :integer
#  amount                 :decimal(32, 16)
#  txid                   :string
#  state                  :integer
#  created_at             :datetime
#  updated_at             :datetime
#  member_id              :integer
#  currency               :integer
#  done_at                :datetime
#  fund_uid               :string
#  fund_extra             :string
#  fee                    :decimal(32, 16)
#  aasm_state             :string
#  confirmations          :string
#  type                   :string
#  payment_transaction_id :integer
#  txout                  :integer
#
# Indexes
#
#  index_deposits_on_txid_and_txout  (txid,txout)
#

FactoryBot.define do
  factory :deposit do
    member { create(:member) }
    account { member.get_account(currency) }
    currency { 'btc' }
    fund_uid { Faker::Lorem.characters }
    fund_extra { Faker::Lorem.characters }
    amount { (100..10000).to_a.sample.to_d }
    txid { Faker::Lorem.characters(16) }
  end
end
