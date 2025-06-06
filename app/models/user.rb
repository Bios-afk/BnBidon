class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :flat_reviews, dependent: :destroy
  has_one_attached :avatar

  #ajout thibault
  has_many :received_bookings, through: :flats, source: :bookings
  #

  # validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
