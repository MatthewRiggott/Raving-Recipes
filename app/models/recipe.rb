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
    high_favorites = []
    good_ingredient_list = []
    good_ingredients = {}
    current_user.favorites.each do |favorite|
      favorites.push(favorite.recipe)
      rating = Rate.find_by(rater_id: current_user, dimension: "value", rateable_id: favorite.recipe)
      high_favorites.push favorite.recipe if rating >= 4
      break if high_favorites.count > 20
    end
    high_favorites.each do |recipe|
      recipe.ingredients.each do |ingredient|
        # build an array of favored ingredients
        good_ingredients[ingredient] = 0
      end
    end
    good_ingredients.keys.each do |match_ingredient|
      good_ingredients.keys.each do |second_ingredient|
        match_ingredient.split(" ").each do |str|
          str.each do |word|
            if second_ingredient.include?(word)
              good_ingredients[match_ingredient] += 1
              good_ingredients[second_ingredient] += 1
              break
            end
          end
        end
      end
    end

    # expensive query - may need to refactor if things get slow
    recipes = Recipe.where("id NOT IN (?)", favorites)
  end

  private

  def add_to_favorites
    Favorite.create(user: self.owner, recipe: self)
  end
end
