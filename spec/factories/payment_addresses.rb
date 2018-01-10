# == Schema Information
#
# Table name: payment_addresses
#
#  id         :integer          not null, primary key
#  account_id :integer
#  address    :string
#  created_at :datetime
#  updated_at :datetime
#  currency   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :payment_address do
    address "MyString"
    account { create(:member).get_account(:eur) }

    trait :btc_address do
      address { Faker::Bitcoin.address }
      account { create(:member).get_account(:btc) }
      currency { YmlCurrency.find_by_code('btc').id }
    end

    factory :btc_payment_address, traits: [:btc_address]
  end
end
