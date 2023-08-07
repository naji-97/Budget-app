class TransactionBudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = current_user.categories.find(params[:category_id])
    @transactions = @category.transaction_budgets.order(created_at: :desc)
    @total_amount = @category.transaction_budgets.sum(:amount)
  end
end
