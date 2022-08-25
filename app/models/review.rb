class Review < ApplicationRecord
  belongs_to :restaurant # allows us to do @review.restaurant

  validates :content, presence: true
  validates :rating, presence: true, numericality: { in: 0..5, only_integer: true }
end
