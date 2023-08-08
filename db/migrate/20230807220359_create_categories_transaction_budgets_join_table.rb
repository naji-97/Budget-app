# frozen_string_literal: true

class CreateCategoriesTransactionBudgetsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_transaction_budgets, id: false, force: :cascade do |t|
      t.belongs_to :category
      t.belongs_to :transaction_budget
    end
  end
end
