class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    if params[:query].present?
      @flats = Flat.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end

    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "flats/info_window", locals: { flat: flat }),
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @photos = @flat.photos
    @booking = Booking.new
    @markers = [{
    lat: @flat.latitude,
    lng: @flat.longitude,
    info_window_html: render_to_string(partial: "flats/info_window", locals: { flat: @flat })
  }]
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
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("flat_form_modal", partial: "flats/form", locals: { flat: @flat }), status: :unprocessable_entity }
        format.html do
          flash.now[:alert] = "Merci de corriger les erreurs."
          render partial: 'flats/form', locals: {flat: @flat}, status: :unprocessable_entity
        end
      end
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
