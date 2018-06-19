class ArtistsController < ApplicationController
  def index
    if params[:genre].present?
      @artists = Artist.where(genre: params[:genre])
     # if params[:query].present?
         # sql_query = " \
           # artists.name @@ :query \
           # OR artists.genre @@ :query \
        #{}"
      # @artists = Artist.joins(:artist).where(sql_query, query: "%#{params[:query]}%")
    else
      @artists = Artist.all
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :location, :price, :genre, :description)
  end
end
