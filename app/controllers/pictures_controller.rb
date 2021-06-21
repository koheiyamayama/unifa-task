class PicturesController < ApplicationController
  before_action :redirect_login_for_not_login_user

  def index
    @pictures = Picture.all
  end

  def new
  end

  def create
    picture = Picture.new(
      user_id: session[:user_id], 
      title: pictures_params[:title], 
      file: pictures_params[:file]
    )
    if picture.save
      redirect_to pictures_path
    else
      @error_messages = picture.errors.full_messages
      render :new
    end
  end

  private
  
  def pictures_params
    params.require(:pictures).permit(:title, :file)
  end
end
