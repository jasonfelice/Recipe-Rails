class RecipeFoods < ApplicationController
  def new; end

  def create
    @recipe = Recipe.find(params[:recipe_id])
  end
end