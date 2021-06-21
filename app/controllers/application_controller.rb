class ApplicationController < ActionController::Base
  private

  def redirect_login_for_not_login_user
    redirect_to root_path unless User.login?(session[:user_id])
  end
end
