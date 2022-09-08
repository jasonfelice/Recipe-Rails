class AlterInventoriesFk < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :inventories, :users
    add_foreign_key :inventories, :users, on_delete: :cascade
  end
end
