class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @flat = Flat.find(params[:id])
  end
end
