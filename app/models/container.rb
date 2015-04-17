class Container < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  after_create :add_to_viewed

  validates :user, presence: true, uniqueness: { scope: :recipe }

  private

  def add_to_viewed
    View.find_or_create_by(user: self.user, recipe: self.recipe)
    Recipe.vote_count.increment!
  end
end
