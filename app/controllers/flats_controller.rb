class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @flat = Flat.find(params[:id])
    @photos = @flat.photos
    @booking = Booking.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    @flat.photos.attach(params[:flat][:photos]) if params[:flat][:photos].present?

    if @flat.save
      redirect_to dashboard_path, notice: "Logement ajouté."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price, :photos)
  end

end
