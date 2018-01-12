# == Schema Information
#
# Table name: api_tokens
#
#  id                    :integer          not null, primary key
#  member_id             :integer          not null
#  access_key            :string(50)       not null
#  secret_key            :string(50)       not null
#  created_at            :datetime
#  updated_at            :datetime
#  trusted_ip_list       :string
#  label                 :string
#  oauth_access_token_id :integer
#  expire_at             :datetime
#  scopes                :string
#  deleted_at            :datetime
#
# Indexes
#
#  index_api_tokens_on_access_key  (access_key) UNIQUE
#  index_api_tokens_on_secret_key  (secret_key) UNIQUE
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :api_token do
    member
    scopes 'all'
  end
end
