class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user]).where(user_id: current_user.id).order(created_at: :desc)
  end

  def public
    @public_recipes = Recipe.includes([:user]).where(public: true).order(created_at: :desc)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to user_recipes_path(current_user.id), notice: 'Recipe Added successfully!'
    else
      render :show
    end
  end

  def show
    @recipe = Recipe.includes([:user]).find(params[:id])
    @inventories = current_user.inventories
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path, notice: 'Recipe deleted!'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
