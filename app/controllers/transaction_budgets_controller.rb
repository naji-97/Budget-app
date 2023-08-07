class TransactionBudgetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = current_user.categories.find(params[:category_id])
    @transactions = @category.transaction_budgets.order(created_at: :desc)
    @total_amount = @category.transaction_budgets.sum(:amount)
  end


  def create
    @category = current_user.categories.find(params[:category_id])
    @transaction = @category.transaction_budgets.new(transaction_params)
    if @transaction.save
      redirect_to category_transaction_budgets_path(@category), notice: 'Transaction created successfully.'
    else
      render :new
    end
  end

end
