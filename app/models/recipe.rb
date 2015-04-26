class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, dependent: :destroy
  has_many :directions, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  belongs_to :owner, class_name: "User"
  ratyrate_rateable "value"
  searchkick
  paginates_per 10

  after_create :add_to_favorites

  validates :image_url, presence: true
  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true
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
    good_ingredients = Hash.new(0)
    top_suggestions = []

    User.includes(:favorites)
    user.favorites.each do |favorite|
      favorites.push(favorite.recipe)
      rating = Rate.find_by(rater_id: user, dimension: "value", rateable_id: favorite.recipe)
      high_favorites.push favorite.recipe if rating.nil? || rating.stars >= 4
    end

    Favorite.includes(:recipe)
    high_favorites.each do |recipe|
      Recipe.includes(:ingredients)
      recipe.ingredients.each do |ingredient|
        rating = Rate.find_by(rater_id: user, dimension: "value", rateable_id: recipe)

        # build an scored hash of favored ingredient keywords
        Ingredient.includes(:keywords)
        ingredient.keywords.each do |keyword|
          if rating == 5
            good_ingredients[keyword.noun] += 5
          elsif rating == 4
            good_ingredients[keyword.noun] += 3
          else
            good_ingredients[keyword.noun] += 2
          end
        end
      end
    end

    # lets score some recipe suggestions
    suggestions = Hash.new(0)
    search_keys = (good_ingredients.sort_by { |_, v| -v })
    search_keys[0..9].each do |keyword|
      Keyword.find_by(noun: keyword[0]).ingredients.each do |ingredient|
        Ingredient.includes(:recipes)
        ingredient.recipes.each do |recipe|
          suggestions[recipe] += good_ingredients[keyword]
        end
      end
    end
    # find the best recipes
    suggestions.sort_by { |_, v| -v }.each do |ranked_suggestion|
      top_suggestions << ranked_suggestion[0] if Recipe.where("id NOT IN (?)", favorites)
      break if top_suggestions.size > 9
    end
    top_suggestions
  end

  private

  def add_to_favorites
    Favorite.create(user: self.owner, recipe: self)
  end
end
