class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def update_avatar
    @user = current_user

    if params[:user][:avatar].present?
      @user.avatar.attach(params[:user][:avatar])
      redirect_to dashboard_path, notice: 'Picture updated successfully.'
    else
      redirect_to dashboard_path, alert: "Please select an image to upload."
    end
  end

end
