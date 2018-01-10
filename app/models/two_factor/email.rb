# == Schema Information
#
# Table name: two_factors
#
#  id             :integer          not null, primary key
#  member_id      :integer
#  otp_secret     :string
#  last_verify_at :datetime
#  activated      :boolean
#  type           :string
#  refreshed_at   :datetime
#

class TwoFactor::Email < ::TwoFactor

end
