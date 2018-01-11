# == Schema Information
#
# Table name: identities
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  is_active       :boolean          default(TRUE)
#  retry_count     :integer          default(0)
#  is_locked       :boolean          default(FALSE)
#  locked_at       :datetime
#  last_verify_at  :datetime
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_identities_on_email  (email) UNIQUE
#

require 'spec_helper'

describe Identity do
  it {  is_expected.to allow_value("pas1Word").for(:password) }
  it {  is_expected.to allow_value("pas1Wo@d").for(:password) }
  it {  is_expected.to allow_value("pas1Wo_d").for(:password) }
  it {  is_expected.to allow_value("123456").for(:password) }
  it {  is_expected.not_to allow_value("pwd").for(:password) }

  it "should unify email" do
    create(:identity, email: 'foo@example.com')
    id = build(:identity, email: 'Foo@example.com')
    expect(id.valid?).to eq(false)
  end

end
