class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(show)

  def show
    @user = User.find(params[:id])
  end

  private
  def logged_in_user
    return if logged_in?

    flash[:danger] = t("controller.require_login")
    redirect_to login_url
  end
end
