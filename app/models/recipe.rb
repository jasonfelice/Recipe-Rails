class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id', dependent: :destroy, class_name: 'RecipeFood'

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
