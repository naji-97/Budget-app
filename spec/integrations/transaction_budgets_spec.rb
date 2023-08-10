require 'rails_helper'

RSpec.describe 'Transaction_budget', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, author: user) }

  before do
    user.skip_confirmation!
    login_as user
  end

  it 'creates a transaction' do
    transaction_budget_name = 'transaction Name'
    transaction_budget_amount = 50.00
    FactoryBot.create(:transaction_budget, name: transaction_budget_name, amount: transaction_budget_amount,
                                           author: user, category_ids: [category.id])
    visit category_transaction_budgets_path(category)
    expect(page).to have_content(transaction_budget_name)
  end
end
