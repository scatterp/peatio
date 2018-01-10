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

require 'spec_helper'

describe PaymentTransaction do
  it "expect state transfer" do
    tx = create(:payment_transaction, deposit: create(:deposit))
    tx.stubs(:refresh_confirmations)

    tx.stubs(:min_confirm?).returns(false)
    tx.stubs(:max_confirm?).returns(false)

    expect(tx.unconfirm?).to be_true
    expect(tx.check).to be_false
    expect(tx.check).to be_false
    expect(tx.check).to be_false
    expect(tx.unconfirm?).to be_true

    tx.stubs(:min_confirm?).returns(true)
    tx.stubs(:max_confirm?).returns(false)

    expect(tx.check).to be_true
    expect(tx.confirming?).to be_true

    tx.stubs(:min_confirm?).returns(false)
    tx.stubs(:max_confirm?).returns(true)

    expect(tx.check).to be_true
    expect(tx.confirmed?).to be_true
    expect(tx.check).to be_true
  end

end
