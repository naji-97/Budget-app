require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, author: user) }

  before do
    user.skip_confirmation!
    login_as user
  end

  it 'creates a category' do
    visit category_transaction_budgets_path(category)

    expect(page).to have_content(category.name)
  end
end
