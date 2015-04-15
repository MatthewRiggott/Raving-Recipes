class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  before_validation :add_or_find_ingredient, :on => :create

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :numerator_amount, presence: true, numericality: { only_integer: true }
  validates :denominator_amount, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true
  validates :ingredient, uniqueness: { scope: :recipe }

  private

  def add_or_find_ingredient(name)
    if Ingredient.find_by(:name)
      ingredient = Ingredient.new(name: name)

    else

    end
  end
end
