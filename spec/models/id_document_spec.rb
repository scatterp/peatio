# == Schema Information
#
# Table name: id_documents
#
#  id                 :integer          not null, primary key
#  id_document_type   :integer
#  name               :string
#  id_document_number :string
#  member_id          :integer
#  created_at         :datetime
#  updated_at         :datetime
#  birth_date         :date
#  address            :text
#  city               :string
#  country            :string
#  zipcode            :string
#  id_bill_type       :integer
#  aasm_state         :string
#

require 'spec_helper'

describe IdDocument do
  let(:member) { create(:member) }
  subject { member.id_document }

  it { should be_valid }

  context 'aasm_state' do
    describe 'default state' do
      its(:aasm_state) { should eq('unverified') }
    end

    describe 'submit' do
      before do
        subject.submit
      end

      its(:aasm_state) { should eq('verifying') }
    end

    describe 'verified' do
      before do
        subject.submit
        subject.approve
      end

      its(:aasm_state) { should eq('verified') }
    end

    describe 'reject' do
      before do
        subject.submit
        subject.reject
      end

      its(:aasm_state) { should eq('unverified') }
    end
  end
end
