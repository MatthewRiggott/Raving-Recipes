class Keyword < ActiveRecord::Base
  has_many :keyword_joins
  has_many :ingredients, through: :keyword_joins
  validates :noun, presence: true, uniqueness: true
end
