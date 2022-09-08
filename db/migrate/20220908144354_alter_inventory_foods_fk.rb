class AlterInventoryFoodsFk < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :inventory_foods, :foods
    add_foreign_key :inventory_foods, :foods, on_delete: :cascade

    remove_foreign_key :inventory_foods, :inventories
    add_foreign_key :inventory_foods, :inventories, on_delete: :cascade
  end
end
