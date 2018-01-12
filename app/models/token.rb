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

class Token < ApplicationRecord
  belongs_to :member

  before_validation :generate_token, on: :create

  validates_presence_of :member, :token
  validate :check_latest_send, on: :create

  scope :with_member, -> (id) { where(member_id: id) }
  scope :with_token, -> (token) { where(token: token) }
  scope :available, -> { where("expire_at > ? and is_used = ?", DateTime.now, false) }

  class << self
    def verify(token)
      with_token(token).available.any?
    end

    def for_member(member)
      token = find_or_create_by(member_id: member.id, is_used: false)

      if token.expired?
        token = create(member_id: member.id)
      end

      token
    end
  end

  def to_param
    self.token
  end

  def expired?
    expire_at <= Time.now
  end

  def confirm!
    self.update is_used: true
  end

  private

  def check_latest_send
    latest = self.class.available.with_member(self.member_id)
      .order(:created_at).reverse_order.first

    if latest && latest.created_at > 30.minutes.ago
      self.errors.add(:base, :too_soon)
    end
  end

  def generate_token
    self.token = SecureRandom.hex(16)
    self.expire_at = 30.minutes.from_now
  end
end
