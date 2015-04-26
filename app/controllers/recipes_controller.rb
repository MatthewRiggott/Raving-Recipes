class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = search_recipes
  end

  def show
    @ingredient = Ingredient.new
    @direction = Direction.new
    @favorite = Favorite.new
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe_ingredient = RecipeIngredient.new
    @direction = Direction.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.owner = current_user

    if @recipe.save
      redirect_to edit_recipe_path(@recipe), notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        redirect_to @recipe, notice: 'Recipe was successfully updated.'
      else
       render :edit
      end
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def search_recipes
    if params[:search].present?
      @recipes = Recipe.search(
        params[:search],
        order: { vote_count: :desc }
      )
    else
      @recipes = Recipe.order(:name).page params[:page]
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :description,
      :category,
      :prep_time,
      :image_url,
      :country
    )
  end
end
