class Food < ApplicationRecord
  has_many :recipe_food
  has_many :inventory_food
end
