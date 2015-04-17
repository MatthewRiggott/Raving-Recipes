class ExploresController < ApplicationController

  def like
    Container.find_or_create_by(recipe: params[:recipe_id], user: current_user)
  end

  def view_next
    Container.find_or_create_by(recipe: params[:recipe_id], user: current_user)
  end

  private

  def next_recipe
    Recipe.where.not(id: current_user.views.recipe).sample
  end
end
