class ApplicationController < ActionController::Base
  private

  def redirect_login_for_not_login_user
    p session[:user_id]
    redirect_to root_path unless User.login?(session[:user_id])
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
