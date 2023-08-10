# spec/models/transaction_budget_spec.rb
require 'rails_helper'
require 'faker'

RSpec.describe TransactionBudget, type: :model do
  it 'is valid with valid attributes' do
    transaction_budget = build(:transaction_budget)
    expect(transaction_budget).to be_valid
  end

  it 'is not valid without a name' do
    transaction_budget = build(:transaction_budget, name: nil)
    expect(transaction_budget).not_to be_valid
  end

  it 'is not valid without an amount' do
    transaction_budget = build(:transaction_budget, amount: nil)
    expect(transaction_budget).not_to be_valid
  end

  it 'is not valid with a non-positive amount' do
    transaction_budget = build(:transaction_budget, amount: -10)
    expect(transaction_budget).not_to be_valid
  end
end
