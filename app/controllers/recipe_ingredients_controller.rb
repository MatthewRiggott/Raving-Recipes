class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:edit, :update, :destroy]

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def edit
  end

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient.name = recipe_ingredient_params[:name]
    if @recipe_ingredient.save
      redirect_to edit_recipe_path(@recipe_ingredient.recipe), notice: 'Recipe ingredient was successfully created.'
    else
      render :new
    end
  end

  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to @recipe_ingredient, notice: 'Recipe ingredient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe_ingredient.destroy
    redirect_to recipe_ingredients_url, notice: 'Recipe ingredient was successfully destroyed.'
  end

  private

    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    def recipe_ingredient_params
      params.require(:recipe_ingredient).permit(:recipe_id, :ingredient_id, :unit, :amount, :name, :numerator_amount, :denominator_amount)
    end
end
