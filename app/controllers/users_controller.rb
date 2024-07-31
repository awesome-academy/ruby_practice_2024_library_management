class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(show)
  before_action :set_user, only: %i(borrow_history)

  def show
    @user = User.find_by(id: params[:id])
  end

  def borrow_history
    @borrow_requests = @user.borrow_requests.order(created_at: :desc)
  end

  private
  def logged_in_user
    return if logged_in?

    flash[:danger] = t("controller.require_login")
    redirect_to login_url
  end

  def set_user
    @user = current_user
  end
end
