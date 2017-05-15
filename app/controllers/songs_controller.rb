class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
 
  def show
    @song = Song.find(params[:id])
  end
 
  def new
    @song = Song.new
  end
 
  def edit
    @song = Song.find(params[:id])
  end
 
  def create
    @song = Song.new(song_params)
 
    if @song.save
      redirect_to @song
    else
      render 'new'
    end
  end
 
  def update
    @song = Song.find(params[:id])
 
    if @song.update(song_params)
      redirect_to @song
    else
      render 'edit'
    end
  end
 
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
 
    redirect_to songs_path
  end

  def songsearch
    @songs = Song.all 
  end

  def songfilter
    @songs = Song.by_title(params[:title_s]).by_genre(params[:genre_s]) 
    #@songs = @songs.by_genre(params[:genre_s])
    @songs = @songs.by_artist(params[:artist_s])     
  end
 
  private
    def song_params
      params.require(:song).permit(:title, :genre)
    end
end
