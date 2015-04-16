class RecipeIngredient < ActiveRecord::Base
  attr_accessor :name

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

  def add_or_find_ingredient
    if Ingredient.find_by(name: self.name)
      ingredient = Ingredient.find(self.name)
      self.ingredient = ingredient
    else
      ingredient = Ingredient.new(name: self.name)
      if ingredient.save
        self.ingredient = ingredient
      else
        self.errors.add(:name, "Invalid ingredient")
      end
    end
  end
end
