FactoryBot.define do
  factory :fund_source do
    extra 'bitcoin'
    uid { Faker::Bitcoin.address }
    is_locked false
    currency 'btc'

    member { create(:member) }

    trait :eur do
      extra 'bc'
      uid { SecureRandom.hex(16) }
      currency 'eur'
    end

    factory :eur_fund_source, traits: [:eur]
    factory :btc_fund_source
  end
end

