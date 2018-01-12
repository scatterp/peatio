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

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :comment do
    sequence(:content) { |n| "Content #{n}" }
    ticket
    author
  end

end
