class DirectionsController < ApplicationController
  before_action :set_direction, only: [:show, :edit, :update, :destroy]

  def index
    @directions = Direction.all
  end

  def show
  end

  def new
    @direction = Direction.new
  end

  def edit
  end

  def create
    @direction = Direction.new(direction_params)
    @direction.recipe = Recipe.find(params[:recipe_id])
    if @direction.save
      redirect_to edit_recipe_path(@direction.recipe), notice: 'Direction was successfully created.'
    else
      render :new
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
