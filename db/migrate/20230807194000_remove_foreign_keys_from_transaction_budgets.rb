# frozen_string_literal: true

class RemoveForeignKeysFromTransactionBudgets < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key 'transaction_budgets', column: 'author_id'
  end
end
