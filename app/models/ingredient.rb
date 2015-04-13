class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients

  validates :name, presence: true, uniqueness: true
end
