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

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_update_params)
      redirect_to user_recipe_url(@recipe_food.recipe.user, @recipe_food.recipe), notice: "Recipe food updated Successfully!"
    else
      redirect_to user_recipe_url(@recipe_food.recipe.user, @recipe_food.recipe), alert: "Something went wrong!"
    end
  end

  private
  def recipe_update_params
    params.permit(:quantity, :food_id)
  end
end