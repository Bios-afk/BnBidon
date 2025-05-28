class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @flats = Flat.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end
end
