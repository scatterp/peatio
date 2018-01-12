# == Schema Information
#
# Table name: running_accounts
#
#  id          :integer          not null, primary key
#  category    :integer
#  income      :decimal(32, 16)  default(0.0), not null
#  expenses    :decimal(32, 16)  default(0.0), not null
#  currency    :integer
#  member_id   :integer
#  source_type :string
#  source_id   :integer
#  note        :string
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_running_accounts_on_member_id                  (member_id)
#  index_running_accounts_on_source_type_and_source_id  (source_type,source_id)
#

class RunningAccount < ApplicationRecord
  include Currencible

  CATEGORY = {
    withdraw_fee:         0,
    trading_fee:          1,
    register_reward:      2,
    referral_code_reward: 3,
    deposit_reward:       4
  }

  enumerize :category, in: CATEGORY

  belongs_to :member
  #belongs_to :source, polymorphic: true --WTF???

end
