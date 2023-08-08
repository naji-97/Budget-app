class RemoveForeignKeysFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key "categories", column: "author_id"
  end
end
