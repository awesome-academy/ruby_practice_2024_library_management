class ApplicationController < ActionController::Base
  include SessionsHelper
  def authenticate_user!
    return if current_user

    redirect_to login_path, alert: t("controller.application_reqire")
  end
end
