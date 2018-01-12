# == Schema Information
#
# Table name: withdraws
#
#  id         :integer          not null, primary key
#  account_id :integer
#  amount     :decimal(32, 16)
#  fund_uid   :string
#  created_at :datetime
#  updated_at :datetime
#  txid       :string
#  fund_extra :string
#  done_at    :datetime
#  member_id  :integer
#  currency   :integer
#  fee        :decimal(32, 16)
#  sn         :string
#  aasm_state :string
#  sum        :decimal(32, 16)  default(0.0), not null
#  type       :string
#

module Withdraws
  class Tritiumcoin < ::Withdraw
    include ::AasmAbsolutely
    include ::Withdraws::Coinable
    include ::FundSourceable
  end
end
