class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def update_avatar
    @user = current_user
    
    if params[:user][:avatar].present?
      @user.avatar.attach(params[:user][:avatar])
    else
      redirect_to dashboard_path, alert: "Veuillez sélectionner une image."
    end
  end

end
