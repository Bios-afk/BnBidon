class User < ApplicationRecord
  has_many :bookings
  has_many :flat_reviews

  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
  validates :last_name, presence: true
end
