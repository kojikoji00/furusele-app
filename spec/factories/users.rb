FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'password'}
    income_id {'1'}
    family_id{'1'}
  end
end
