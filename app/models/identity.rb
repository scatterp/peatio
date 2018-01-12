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

class Identity < OmniAuth::Identity::Models::ActiveRecord
  auth_key :email
  attr_accessor :old_password

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 6, maximum: 64 }
  validates :password_confirmation, presence: true, length: { minimum: 6, maximum: 64 }

  before_validation :sanitize

  def increment_retry_count
    self.retry_count = (retry_count || 0) + 1
  end

  def too_many_failed_login_attempts
    retry_count.present? && retry_count >= ENV['MAX_LOGIN_ATTEMPTS'].to_i
  end

  private

  def sanitize
    self.email = self.email&.downcase
  end

end
