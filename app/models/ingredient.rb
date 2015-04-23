class Ingredient < ActiveRecord::Base
  attr_accessor :numerator_amount, :denominator_amount, :unit
  has_many :recipe_ingredients
  has_many :keywords, through: :keyword_joins
  has_many :keyword_joins

  validates :name, presence: true, uniqueness: true
end
