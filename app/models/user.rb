class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :foods
  validates :email, :password, presence: true

  def sum(array)
    sum = 0
    array.each do |number|
      sum += number.quantity * number.food.price
    end
    sum
  end
end
