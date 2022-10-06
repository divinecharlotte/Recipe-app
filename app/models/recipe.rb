class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipefoods
  has_many :foods, through: :recipefoods
end
