class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  after_create :adjust_rating
  validates :user, presence: true, uniqueness: { scope: :recipe }

private

  def adjust_rating
    recipe = self.recipe
    recipe.increment!(:rating_count)
    recipe.increment!(:rating_value, by: self.value)
  end

end
