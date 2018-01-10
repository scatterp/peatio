# == Schema Information
#
# Table name: tokens
#
#  id         :integer          not null, primary key
#  token      :string
#  expire_at  :datetime
#  member_id  :integer
#  is_used    :boolean          default(FALSE)
#  type       :string
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_tokens_on_type_and_token_and_expire_at_and_is_used  (type,token,expire_at,is_used)
#

require 'spec_helper'

describe Token::Activation do
  let(:member) { create :member }
  let(:activation) { create :activation, member: member }

  it '#confirm!' do
    activation.confirm!

    expect(member).to be_activated
  end

  it 'sends token after creation' do
    activation
    mail = ActionMailer::Base.deliveries.last
    expect(mail.subject).to match('Account Activation')
  end

end
