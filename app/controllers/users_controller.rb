class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    # Calculer les statistiques
    @bookings_count = @user.bookings.count
    @reviews_count = @user.flat_reviews.count
  end

end
