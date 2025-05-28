class Booking < ApplicationRecord
  attr_accessor :range_date
  
  belongs_to :user
  belongs_to :flat

  validates :start_date, presence: true
  validates :end_date, presence: true

end
