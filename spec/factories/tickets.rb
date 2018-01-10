# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :ticket do
    sequence(:content) { |n| "Content #{n}" }
    author
  end
end
