class View < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  validates :user, presence: true, uniqueness: { scope: :recipe }
end
