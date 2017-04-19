class ConcertSongsController < ApplicationController
  def index
    @concert_songs = Concert_song.all
  end
 
  def show
    @concert_song = Concert_song.find(params[:id])
  end
 
  def new
    @concert_song = Concert_song.new
  end
 
  def edit
    @concert_song = Concert_song.find(params[:id])
  end
 
  def create
    @concert_song = Concert_song.new(concert_song_params)
 
    if @concert_song.save
      redirect_to @concert_song
    else
      render 'new'
    end
  end
 
  def update
    @concert_song = Concert_song.find(params[:id])
 
    if @concert_song.update(concert_song_params)
      redirect_to @concert_song
    else
      render 'edit'
    end
  end
 
  def destroy
    @concert_song = Concert_song.find(params[:id])
    @concert_song.destroy
 
    redirect_to concert_songs_path
  end
 
  private
    def concert_song_params
      params.require(:concert_song).permit()
    end
end
