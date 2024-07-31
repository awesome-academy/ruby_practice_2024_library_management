class SessionsController < ApplicationController
  def new
    session[:return_to] = params[:return_to] if params[:return_to]
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.find_by(email:)
    if user&.authenticate(password)
      successful_login(user)
    else
      flash.now[:alert] = t("controller.login_fail")
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: t("controller.logout_succed")
  end

  private
  def successful_login user
    log_in user
    flash[:notice] = t("controller.login_succed")
    redirect_to(session[:return_to] || root_path)
    session.delete(:return_to)
  end
end
