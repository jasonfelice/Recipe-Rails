class ShoppingListsController < ApplicationController
  def generate
    recipe_food = RecipeFood.where(recipe_id: shopping_params[:recipe_id])
    inventory_food = InventoryFood.where(inventory_id: shopping_params[:inventory_id])
    diff = missing_items(recipe_food, inventory_food)
    total_price = 0
    diff.each do |item|
      total_price += item[:price].to_i
    end
    recipe = Recipe.find(shopping_params[:recipe_id])
    inventory = Inventory.find(shopping_params[:inventory_id])
    @result = { total_price:, missing_items: diff.length, items: diff, recipe_name: recipe.name,
                inventory_name: inventory.name, recipe_id: shopping_params[:recipe_id],
                inventory_id: shopping_params[:inventory_id] }
    p @result
    redirect_to shopping_list_path(result: @result)
  end

  def missing_items(recipe_food, inventory_food)
    diff = []
    found = false
    recipe_food.each do |rec_food|
      inventory_food.each do |inv_food|
        next unless rec_food.food_id == inv_food.food_id

        found = true
        next unless (rec_food.quantity - inv_food.quantity).positive?

        diff << { name: rec_food.food.name, quantity: rec_food.quantity - inv_food.quantity,
                  measurement_unit: rec_food.food.measurement_unit,
                  price: rec_food.food.price * (rec_food.quantity - inv_food.quantity) }
      end
      unless found
        diff << { name: rec_food.food.name, quantity: rec_food.quantity,
                  measurement_unit: rec_food.food.measurement_unit,
                  price: rec_food.food.price * rec_food.quantity }
      end
      found = false
    end
    diff
  end

  def show
    @result = params[:result]
  end

  def shopping_params
    params.permit(:inventory_id, :recipe_id)
  end
end
