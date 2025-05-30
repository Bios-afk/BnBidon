class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @flats = current_user.flats
    @user = current_user
    @bookings_count = current_user.bookings.count
    @reviews_count = current_user.flat_reviews.count
    # 1. Réservations faites par l'utilisateur
    @my_bookings = current_user.bookings.includes(:flat)

    # 2. Réservations reçues sur ses logements
    @received_bookings = Booking.joins(:flat)
                                .where(flats: { user_id: current_user.id })
                                .includes(:flat, :user)
  end
end
