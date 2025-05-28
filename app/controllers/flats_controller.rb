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
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to dashboard_path, notice: "Logement créé avec succès." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])

    if @flat.destroy
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to dashboard_path, notice: "Logement supprimé." }
      end
    else
      redirect_to dashboard_path, alert: "Erreur : #{@flat.errors.full_messages.join(", ")}"
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price, :photos)
  end

end
