class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :delete_all
end
