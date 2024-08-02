class SessionsController < ApplicationController
  def new; end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.find_by(email:)
    if user&.authenticate(password)
      log_in user
      redirect_to root_path, notice: t("controller.login_succed")
    else
      flash.now[:alert] = t("controller.login_fail")
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: t("controller.logout_succed")
  end
end
