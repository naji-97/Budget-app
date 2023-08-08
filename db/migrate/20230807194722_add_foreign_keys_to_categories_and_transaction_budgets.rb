class AddForeignKeysToCategoriesAndTransactionBudgets < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "categories", "users", column: "author_id"
    add_foreign_key "transaction_budgets", "users", column: "author_id"
  end
end
