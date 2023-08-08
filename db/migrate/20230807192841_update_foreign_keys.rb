# frozen_string_literal: true

class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key 'categories', 'authors'
    add_foreign_key 'categories', 'users', column: 'author_id'

    remove_foreign_key 'transaction_budgets', 'authors'
    add_foreign_key 'transaction_budgets', 'users', column: 'author_id'
  end
end
