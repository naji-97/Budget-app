class TransactionBudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, only: %i[index new create]

  def index
    @transactions = @category.transaction_budgets.order(created_at: :desc)
    @total_amount = @transactions.sum(:amount)
  end

  def new
    @transaction = TransactionBudget.new
  end

  def create
    @transaction = TransactionBudget.new(transaction_budget_params.merge(author: current_user))

    if @transaction.save
      category_ids = params[:transaction_budget][:category_ids]

      if category_ids.present?
        category_ids.each do |category_id|
          category = Category.find_by(id: category_id)
          category.transaction_budgets << @transaction if category.present?
        end
      end

      redirect_to category_transaction_budgets_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new, alert: "Transaction wasn't created."
    end
  end

  private

  def find_category
    @category = Category.includes(:author).find_by(id: params[:category_id])
  end

  def transaction_budget_params
    params.require(:transaction_budget).permit(:name, :amount)
  end
end
