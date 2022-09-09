class AlterRecipeFoodsFk < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :recipe_foods, :foods
    add_foreign_key :recipe_foods, :foods, on_delete: :cascade
  end
end
