class RemoveRecipeFoodUserForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :recipe_foods, :users
  end
end
