module SessionsHelper
  def logged_in?
    current_user
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = t("helper.session_flash_danger")
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
