# frozen_string_literal: true

class CreateTransactionBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_budgets do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
