class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings


  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :latitude, :longitude, presence: true
  
  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
end
