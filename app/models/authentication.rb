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

class Authentication < ApplicationRecord
  belongs_to :member

  validates :provider, presence: true, uniqueness: { scope: :member_id }
  validates :uid,      presence: true, uniqueness: { scope: :provider }

  class << self
    def locate(auth)
      uid      = auth['uid'].to_s
      provider = auth['provider']
      find_by_provider_and_uid provider, uid
    end

    def build_auth(auth)
      new \
        uid:      auth['uid'],
        provider: auth['provider'],
        token:    auth['credentials'].try(:[], 'token'),
        secret:   auth['credentials'].try(:[], 'secret'),
        nickname: auth['info'].try(:[], 'nickname')
    end
  end
end
