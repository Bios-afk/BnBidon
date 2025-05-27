class BookingsController < ApplicationController
before_action :authenticate_user!

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.build(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to flat_path(@flat), notice: "Réservation confirmée !"
    else
      render "flats/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
