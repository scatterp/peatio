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

class Token::Activation < ::Token
  after_create :send_token

  def confirm!
    super
    member.active!
  end

  private

  def send_token
    TokenMailer.activation(member.email, token).deliver
  end
end
