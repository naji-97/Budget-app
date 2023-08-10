# spec/factories/transaction_budgets.rb
FactoryBot.define do
  factory :transaction_budget do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    association :author, factory: :user
  end
end
