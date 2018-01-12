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

module Deposits
  class Ether < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable

    validates_uniqueness_of :txout, scope: :txid
  end
end
