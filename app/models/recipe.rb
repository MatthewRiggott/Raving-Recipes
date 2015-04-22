class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :directions
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :owner, class_name: "User"
  ratyrate_rateable "value"
  after_create :add_to_favorites

  validates :image_url, presence: true
  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true
  validates :description, presence: true, length: { minimum: 31 }
  validates :prep_time, presence: true, numericality: { only_integer: true }
  validates :vote_count,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  validates :country, presence: true
  validates :rating_count, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :rating_total, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  def self.recommend(user)
    favorites = []
    current_user.favorites.each do |favorite|
      favorites.push(favorite.recipe) if favorite.recipe
    end
    # expensive query - may need to refactor if things get slow
    recipes = Recipe.where("id NOT IN (?)", favorites)


  end

  private

  def add_to_favorites
    Favorite.create(user: self.owner, recipe: self)
  end
end
