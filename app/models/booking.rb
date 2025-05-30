class Booking < ApplicationRecord
  attr_accessor :range_date

  belongs_to :user
  belongs_to :flat

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
  
end
