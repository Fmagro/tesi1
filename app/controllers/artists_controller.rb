class ArtistsController < ApplicationController
def index
    @artists = Artist.all
  end
 
  def show
    @artist = Artist.find(params[:id])

  end
   def managesong
    @artist = Artist.find(params[:id])
    if params[:song_add]
      @song = Song.where(:id  => params[:song_to_add])
      @artist.songs<< @song 
    end
    if (params[:song_del])
      @songd = Song.where(:id  => params[:song_to_delete])
      @artist.songs.delete(@songd)
    end
    redirect_to @artist
  end
 
  def new
    @artist = Artist.new
    @artist.isgroup = false
  end
 
  def edit
    @artist = Artist.find(params[:id])
  end
 
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist
    else
      render 'new'
    end
  end
 
  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end
 
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
 
    redirect_to artists_path
  end
 
  def destroylink
   @artist = Artist.find(params[:id])
   @song = Song.where(:id => params[:song_to_delete])
   if @song
     @artist.songs.delete(@song)
   else
     redirect_to welcome_index
   end
   redirect_to artists_path
 
  end
  private
    def artist_params
      params.require(:artist).permit(:name,:bio,:isgroup )
    end
end
