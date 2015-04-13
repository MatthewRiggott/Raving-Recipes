class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :recipe, presence: true
  validates :body, presence: true
  validates :step_number, numericality: { only_integer: true }
  validates :step_number, uniqueness: { scope: :recipe }
  # try to validate steps in order
end
