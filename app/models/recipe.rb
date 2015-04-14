class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :directions
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :user

  validates :image_url, presence: true
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
  validates :description, presence: true, length: { minimum: 31 }
  validates :prep_time, presence: true, numericality: { only_integer: true }
  #validates :vote_count, presence: true, numericality: { only_integer: true }
  validates :country, presence: true
  validates :rating_count, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :rating_total, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
end
