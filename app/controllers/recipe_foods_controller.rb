class RecipeFoods < ApplicationController
  def new; end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(quantity: params[:quantity], food_id: params[:food_id])
    if @recipe_food.save
      redirect_to user_recipe_url(@recipe.user, @recipe), notice: "Food has been added successfully!"
    else
      render :new, alert: "Something went wrong!"
  end
end