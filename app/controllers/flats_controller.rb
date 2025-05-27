class FlatsController < ApplicationController

  skip_before_action :authenticate_user!, only: :show

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user # si Flat appartient à un utilisateur

    if @flat.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_flat",
            partial: "flats/success",
            locals: { flat: @flat }
          )
        end
        format.html { redirect_to dashboard_path, notice: "Logement ajouté." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @flat = Flat.find(params[:id])
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :address, :price, :longitude, :lattitude)
  end

end
