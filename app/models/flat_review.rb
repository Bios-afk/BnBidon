class FlatReview < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { in: 1..5 }
end
