class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods
  has_many :recipes, through: :recipefoods

  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
