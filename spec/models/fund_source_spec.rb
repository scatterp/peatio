# == Schema Information
#
# Table name: fund_sources
#
#  id         :integer          not null, primary key
#  extra      :string
#  uid        :string
#  is_locked  :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#  member_id  :integer
#  currency   :integer
#

require 'spec_helper'

describe FundSource do

  context '#label' do
    context 'for btc' do
      let(:fund_source) { build(:btc_fund_source) }
      subject { fund_source }

      its(:label) { should eq("#{fund_source.uid} (bitcoin)") }
    end

    context 'bank' do
      let(:fund_source) { build(:eur_fund_source) }
      subject { fund_source }

      its(:label) { should eq('Bank of China#****1234') }
    end
  end

end
