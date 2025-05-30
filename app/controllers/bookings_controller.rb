class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @flat = Flat.find(params[:flat_id])
    range = booking_params[:range_date]

    if range.blank? || !range.include?(" to ")
      flash[:alert] = "Please select a booking period."
      redirect_back(fallback_location: flat_path(@flat)) and return
    end

    start_date_str, end_date_str = range.split(" to ")
    start_date = Date.parse(start_date_str.strip)
    end_date = Date.parse(end_date_str.strip)

    @booking = Booking.new(
      start_date: start_date,
      end_date: end_date,
      flat: @flat,
      user: current_user
    )

    if @booking.save
      redirect_to dashboard_path, notice: "Booking confirmed for #{@flat.name} !"
    else
      @photos = @flat.photos
      @markers = [{
        lat: @flat.latitude,
        lng: @flat.longitude,
        info_window_html: render_to_string(partial: "flats/info_window", locals: { flat: @flat })
      }]
      flash.now[:alert] = "Please correct any errors to finalise your booking."
      render "flats/show", status: :unprocessable_entity
    end
  end

  def validate
    @booking = Booking.find(params[:id])
    @booking.update(status: "validee")

    respond_to do |format|
      format.turbo_stream
      redirect_to dashboard_path, notice: "Booking validated successfully!"
    end
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.update(status: "refusee")

    respond_to do |format|
      format.turbo_stream
      redirect_to dashboard_path, notice: "Booking validated successfully!"
    end
  end
  def update

  end

  private

  def booking_params
    params.require(:booking).permit(:range_date)
  end
end
