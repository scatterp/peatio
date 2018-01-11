# == Schema Information
#
# Table name: trades
#
#  id            :integer          not null, primary key
#  price         :decimal(32, 16)
#  volume        :decimal(32, 16)
#  ask_id        :integer
#  bid_id        :integer
#  trend         :integer
#  currency      :integer
#  created_at    :datetime
#  updated_at    :datetime
#  ask_member_id :integer
#  bid_member_id :integer
#  funds         :decimal(32, 16)
#
# Indexes
#
#  index_trades_on_ask_id         (ask_id)
#  index_trades_on_ask_member_id  (ask_member_id)
#  index_trades_on_bid_id         (bid_id)
#  index_trades_on_bid_member_id  (bid_member_id)
#  index_trades_on_created_at     (created_at)
#  index_trades_on_currency       (currency)
#

require 'spec_helper'

describe Trade, ".latest_price" do
  context "no trade" do
    it { expect(Trade.latest_price(:btceur)).to be_d "0.0" }
  end

  context "add one trade" do
    let!(:trade) { create(:trade, currency: :btceur) }
    it { expect(Trade.latest_price(:btceur)).to eq(trade.price) }
  end
end

describe Trade, ".collect_side" do
  let(:member) { create(:member) }
  let(:ask)    { create(:order_ask, member: member) }
  let(:bid)    { create(:order_bid, member: member) }

  let!(:trades) {[
    create(:trade, ask: ask, created_at: 2.days.ago),
    create(:trade, bid: bid, created_at: 1.day.ago)
  ]}

  it "should add side attribute on trades" do
    results = Trade.for_member(ask.currency, member)
    expect(results).to have(2).trades
    expect(results.find {|t| t.id == trades.first.id }.side).to eq 'ask'
    expect(results.find {|t| t.id == trades.last.id  }.side).to eq 'bid'
  end

  it "should sort trades in reverse creation order" do
    expect(Trade.for_member(ask.currency, member, order: 'id desc').first).to eq trades.last
  end

  it "should return 1 trade" do
    results = Trade.for_member(ask.currency, member, limit: 1)
    expect(results).to have(1).trade
  end

  it "should return trades from specified time" do
    results = Trade.for_member(ask.currency, member, time_to: 30.hours.ago)
    expect(results).to have(1).trade
    expect(results.first).to eq trades.first
  end
end

describe Trade, "#for_notify" do
  let(:order_ask) { create(:order_ask) }
  let(:order_bid) { create(:order_bid) }
  let(:trade) { create(:trade, ask: order_ask, bid: order_bid) }

  subject(:notify) { trade.for_notify('ask') }

  it { expect(notify).not_to be_blank }
  it { expect(notify[:kind]).not_to be_blank }
  it { expect(notify[:at]).not_to be_blank }
  it { expect(notify[:price]).not_to be_blank }
  it { expect(notify[:volume]).not_to be_blank }

  it "should use side as kind" do
    trade.side = 'ask'
    expect(trade.for_notify[:kind]).to eq 'ask'
  end

end
