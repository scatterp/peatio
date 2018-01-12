# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  token      :string
#  secret     :string
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  nickname   :string
#
# Indexes
#
#  index_authentications_on_member_id         (member_id)
#  index_authentications_on_provider_and_uid  (provider,uid)
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :authentication do
    provider "MyString"
    uid "MyString"
    token "MyString"
    secret "MyString"
    member_id 1
  end
end
