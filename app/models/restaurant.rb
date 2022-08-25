class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # all the reviews linked to that restaurant will be deleted
  # allows us to do @restaurant.reviews

  validates :address, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: %w(chinese italian japanese french belgian), message: "%{value} is not a valid category" }

end
