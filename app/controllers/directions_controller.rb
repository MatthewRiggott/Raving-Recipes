class DirectionsController < ApplicationController
  before_action :set_direction, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @direction = Direction.new(direction_params)
    @direction.recipe = Recipe.find(params[:recipe_id])
    if @direction.save
      redirect_to edit_recipe_path(@direction.recipe), notice: 'Direction was successfully created.'
    else
      Direction.fix_order_of_steps(@direction.recipe)
      redirect_to edit_recipe_path(@direction.recipe), notice: 'Invalid step entry'
    end
  end

  def update
    if @direction.update(direction_params)
      redirect_to edit_recipe_path(params[:recipe_id]), notice: 'Direction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @direction.destroy
    redirect_to directions_url, notice: 'Direction was successfully destroyed.'
  end

  private

    def set_direction
      @direction = Direction.find(params[:id])
    end

    def direction_params
      params.require(:direction).permit(:step_number, :recipe_id, :body)
    end
end
