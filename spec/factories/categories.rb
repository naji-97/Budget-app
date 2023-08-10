FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    association :author, factory: :user
  end
end
