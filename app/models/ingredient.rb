class Ingredient < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :keywords, through: :keyword_joins
  has_many :keyword_joins
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, uniqueness: true
end
