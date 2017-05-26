class AlbumsController < ApplicationController
  before_action :set_album, only: [ :edit, :show, :update, :destroy]
  before_action :authenticate_user!
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
  def index
    @albums = Album.all
  end

  def show
    @category= Category.where(id: @album.id)
  end

  def new
    @album = Album.new

  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path, notice: "You just save your portfolio"
    else
      render 'new'
    end   
  end

  def edit
  end

  def update
    if @album.update(album_params)
      flash[:success] = "You just created your portfolio"
      redirect_to album_path(@album)
    else
      render 'edit'
    end    
  end
  
  def destroy
    @album.destroy
    redirect_to root_path
  end

  private

  def set_album
    @album = Album.find(params[:id])

  end

  def set_category
    
  end

  def album_params
    params.require(:album).permit(:title,
                                  :description,
                                  :client,
                                  :category_id,
                                  :image_thumb,
                                  :image_1,
                                  :image_2,
                                  :image_3,
                                  :image_4,
                                  )

  end

end
