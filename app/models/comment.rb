# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  author_id  :integer
#  ticket_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ApplicationRecord
  after_commit :send_notification, on: [:create]

  acts_as_readable on: :created_at
  belongs_to :ticket
  belongs_to :author, class_name: Member.name, foreign_key: 'author_id'

  validates :content, presence: true

  private

  def send_notification
    ticket_author = self.ticket.author

    if ticket_author != self.author
      CommentMailer.user_notification(self.id).deliver
    else
      CommentMailer.admin_notification(self.id).deliver
    end
  end
end
