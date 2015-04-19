class ExploreController < ApplicationController

  def index
    if !current_user.nil?
      @recipe = get_recipes
      @recipe_number = 0
    else
      redirect_to new_user_registration_path
    end
  end

  def like
    Favorite.create(recipe_id: params[:explore_id].to_i, user: current_user)
    @recipe = get_recipes
    @recipe_number = 0
    redirect_to explore_index_path(recipes: @recipe, num: @recipe_number)
  end

  def next_recipe
    @recipe = get_recipes
    @recipe_number = 0
    render :index
  end

  private

  def get_recipes
    favorites = []
    current_user.favorites.each do |favorite|
      favorites.push(favorite.recipe)
    end
    recipes = Recipe.where("id NOT IN (?)", favorites)
    next_recipe = nil
    while next_recipe == nil && !recipes.empty?
      next_recipe = recipes.sample
      next_recipe = nil if favorites.include?(next_recipe)
    end

    return next_recipe
  end
end
