class Food < ApplicationRecord
  belongs_to :user
  has_many :recipefoods, dependent: :delete_all

  validates :measure_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
