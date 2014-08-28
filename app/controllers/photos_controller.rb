class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    # @photo = Photo.new(photo_params)
    @photo = @user.photos.new(photo_params)
    if @photo.save
      session[:photo_id] = @photo.id
      flash[:notice] = "photo was added"
      redirect_to user_photos_path
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "photo updated."
      redirect_to user_photos_path
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = "The photo was deleted."
      redirect_to user_photos_path
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :photo, :user_id)
      # params.require(:user).permit(:user_id)
    end
end
