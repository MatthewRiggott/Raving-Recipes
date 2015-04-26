class ExploreController < ApplicationController
  def index
    if !current_user.nil?
      if session[:suggestions].nil?
        session[:suggestions] = []
        Recipe.recommend(current_user).each do |recipe|
          session[:suggestions] << recipe.id
        end
      elsif session[:suggestions] == []
        session[:suggestions] = nil
      end
      @recipe = Recipe.find(session[:suggestions][0]) unless session[:suggestions].nil?
    else
      redirect_to new_user_registration_path
    end
  end

  def like
    Favorite.create(recipe_id: params[:explore_id].to_i, user: current_user)
    session[:suggestions].shift
    redirect_to explore_index_path
  end

  def next_recipe
    session[:suggestions].shift
    redirect_to explore_index_path
  end
end
