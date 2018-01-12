# == Schema Information
#
# Table name: currencies
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  code        :string           not null
#  symbol      :string           default("฿"), not null
#  is_tradable :boolean          default(FALSE)
#  fiat        :boolean          default(FALSE)
#  data        :jsonb
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_currencies_on_code  (code) UNIQUE
#

class Currency < ApplicationRecord
  jsonb_accessor :data,
    precision: [:integer, default: 0],
    accounts: [:json, array: true, default: []],
    quick_withdraw_max: [:integer, default: 0],
    rpc: :string,
    blockchain: :string,
    address_url: :string

  scope :tradeable, -> { where(is_tradable: true) }

  def self.enumerize
    @_enumerize ||= self.tradeable.pluck(:id, :code).each_with_object({}) {|(id, code), result| result[code] = id }
  end
end
