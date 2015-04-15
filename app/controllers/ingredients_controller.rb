class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    if Ingredient.find_by(name: ingredient_params[:name])
      @Ingredient = Ingredient.find_by(name: ingredient_params[:name])
      @Ingredient.add_to_recipe(@recipe)
    else
      @ingredient = Ingredient.new(ingredient_params)

      if @ingredient.save
        binding.pry
        redirect_to recipe_path(@recipe), notice: 'Ingredient was successfully created.'
      else
        render :show
      end

    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient, notice: 'Ingredient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.'
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(
        :name, :time, :description, :unit,
        :category, :numerator_amount, :denominator_amount
      )
    end
end
