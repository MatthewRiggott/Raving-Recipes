class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  after_create :vote_up
  after_destroy :vote_down

  validates :user, presence: true, uniqueness: { scope: :recipe }

  private

  def vote_up
    self.recipe.increment!(:vote_count)
  end

  def vote_down
    self.recipe.decrement!(:vote_count)
  end
end
