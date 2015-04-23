class Keyword < ActiveRecord::Base
  has_many :keyword_joins

  validates :noun, presence: true

end
