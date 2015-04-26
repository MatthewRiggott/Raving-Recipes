class FavoritesController < ApplicationController

  def create
    recipe = Recipe.find(params[:recipe_id])
    Favorite.find_or_create_by(user: current_user, recipe: recipe)
    redirect_to recipe_path(recipe)
  end
end
