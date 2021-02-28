FactoryBot.define do
  factory :history_detail do
    link {Faker::Lorem.characters(number: 20)}
    name{Faker::Name.name}
    city {Faker::Address.city}
    price {Faker::Lorem.characters(number: 6)}
    description {Faker::Lorem.characters(number: 40)}
    picture_image_path {Faker::Lorem.characters(number: 20)}
    review_image_path {Faker::Lorem.characters(number: 20)}
  end
end
