class SessionsController < ApplicationController
  def new
  end

  def create
    unless valid_params?
      render :new
      return
    end

    user = User.find_by(params[:user_id])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to pictures_path
    else
      @error_messages = ['ユーザIDとパスワードが一致するユーザが登録されていません']
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def callback
    session[:oauth_token] = Oauth.get_token(params[:code])
    redirect_to pictures_path
  end

  private

  def valid_params?
    @error_messages = []
    @error_messages.push('ユーザIDを入力してください') unless params[:user_id].present?
    @error_messages.push('パスワードを入力してください') unless params[:password].present?
    @error_messages.blank?
  end
end
