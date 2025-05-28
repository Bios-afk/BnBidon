class BookingsController < ApplicationController
before_action :authenticate_user!

  def create
    @flat = Flat.find(params[:flat_id])

    range = booking_params[:range_date]

    start_date_str, end_date_str = range.split(" to ")
    start_date = Date.parse(start_date_str.strip)
    end_date = Date.parse(end_date_str.strip)

    @booking = Booking.new
    @booking.start_date = start_date
    @booking.end_date = end_date

    @booking.flat = @flat
    @booking.user = current_user

    if @booking.save
      redirect_to flat_path(@flat), notice: "Réservation confirmée !"
    else
      redirect_to flats_path(@flat), status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:range_date)
  end
end
