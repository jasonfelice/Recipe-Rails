class RemoveFoodUserForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :foods, :users
  end
end
