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

require 'spec_helper'

describe Deposit do
  let(:deposit ) { create(:deposit, amount: 100.to_d) }

  it 'should compute fee' do
    expect(deposit.fee).to eql 0.to_d
    expect(deposit.amount).to eql 100.to_d
  end

  context 'when deposit fee 10%' do
    let(:deposit) { create(:deposit, amount: 100.to_d) }

    before do
      Deposit.any_instance.stubs(:calc_fee).returns([90, 10])
    end

    it 'should compute fee' do
      expect(deposit.fee).to eql 10.to_d
      expect(deposit.amount).to eql 90.to_d
    end
  end
end
