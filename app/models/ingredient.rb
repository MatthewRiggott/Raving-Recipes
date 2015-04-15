class Ingredient < ActiveRecord::Base
  attr_accessor :numerator_amount, :denominator_amount, :unit
  has_many :recipe_ingredients

  validates :name, presence: true, uniqueness: true
end
