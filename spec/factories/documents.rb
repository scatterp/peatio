# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  key        :string
#  title      :string
#  body       :text
#  is_auth    :boolean
#  created_at :datetime
#  updated_at :datetime
#  desc       :text
#  keywords   :text
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :document do
  end
end
