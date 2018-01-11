# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  bid            :integer
#  ask            :integer
#  currency       :integer
#  price          :decimal(32, 16)
#  volume         :decimal(32, 16)
#  origin_volume  :decimal(32, 16)
#  state          :integer
#  done_at        :datetime
#  type           :string(8)
#  member_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  sn             :string
#  source         :string           not null
#  ord_type       :string(10)
#  locked         :decimal(32, 16)
#  origin_locked  :decimal(32, 16)
#  funds_received :decimal(32, 16)  default(0.0)
#  trades_count   :integer          default(0)
#
# Indexes
#
#  index_orders_on_currency_and_state   (currency,state)
#  index_orders_on_member_id            (member_id)
#  index_orders_on_member_id_and_state  (member_id,state)
#  index_orders_on_state                (state)
#

FactoryBot.define do
  factory :order_bid do
    bid :eur
    ask :btc
    currency :btceur
    state :wait
    source 'Web'
    ord_type 'limit'
    price { 1.to_d }
    volume { 1.to_d }
    origin_volume { volume }
    locked { price.to_d * volume.to_d }
    origin_locked { locked }
    member { create :member }
  end

  factory :order_ask do
    bid :eur
    ask :btc
    currency :btceur
    state :wait
    source 'Web'
    ord_type 'limit'
    price { 1.to_d }
    volume { 1.to_d }
    origin_volume { volume }
    locked { price.to_d * volume.to_d }
    origin_locked { locked }
    member { create :member }
  end
end
