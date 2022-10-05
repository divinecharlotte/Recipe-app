class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :recipe_food

  validates :measure_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
