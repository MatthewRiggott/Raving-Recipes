class ExploreController < ApplicationController

  def index
    if !current_user.nil?
      @recipe = next_recipe
    else
      redirect_to new_user_registration_path
    end
  end

  def like
    Container.find_or_create_by(recipe: params[:recipe_id], user: current_user)
  end

  def view_next
    Container.find_or_create_by(recipe: params[:recipe_id], user: current_user)
  end

  private

  def next_recipe
    binding.pry
    Recipe.where.not(id: current_user.views.recipe).sample
  end
end
