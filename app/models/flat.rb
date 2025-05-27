class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  after_validation :geocode, if: :will_save_change_to_address?
end
