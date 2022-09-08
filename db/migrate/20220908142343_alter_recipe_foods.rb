class AlterRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_foods, :user_id
    add_column :recipe_foods, :recipe_id, :bigint
    add_foreign_key :recipe_foods, :recipes, on_delete: :cascade
  end
end
