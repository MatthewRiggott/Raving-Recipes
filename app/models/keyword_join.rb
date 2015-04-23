class KeywordJoin < ActiveRecord::Base
  belongs_to :keyword
  belongs_to :ingredient

  validates :ingredient, presence: true
  validates :keyword, presence: true
end
