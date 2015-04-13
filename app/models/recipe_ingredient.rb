class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, presence: true
  validates :ingredient, presence: true
  validates :numerator_amount, presence: true, numericality: { only_integer: true }
  validates :denominator_amount, presence: true, numericality: { only_integer: true }
  validates :unit, presence: true
  validates :ingredient, uniqueness: { scope: :recipe }
end
