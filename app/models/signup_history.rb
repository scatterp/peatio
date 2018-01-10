# == Schema Information
#
# Table name: signup_histories
#
#  id              :integer          not null, primary key
#  member_id       :integer
#  ip              :string
#  accept_language :string
#  ua              :string
#  created_at      :datetime
#
# Indexes
#
#  index_signup_histories_on_member_id  (member_id)
#

class SignupHistory < ApplicationRecord

end
