class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @flats = current_user.flats
    @flat = Flat.new
    @user = current_user

    @bookings_count = @user.bookings.count
    @reviews_count = @user.flat_reviews.count
    @flats = @user.flats
  end
end
