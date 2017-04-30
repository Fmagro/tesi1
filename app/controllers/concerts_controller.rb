class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end
 
  def show
    @concert = Concert.find(params[:id])
  end
  def manageartist
    @concert = Concert.find(params[:id])
    if params[:artist_add]
      @artist = Artist.where(:id  => params[:artist_to_add])
      @concert.artists<< @artist 
    end
    if (params[:artist_del])
      @artistd = Artist.where(:id  => params[:artist_to_delete])
      @concert.artists.delete(@artistd)
    end
    redirect_to @concert
  end 
  def new
    @concert = Concert.new
  end
 
  def edit
    @concert = Concert.find(params[:id])
  end
 
  def create
    @concert = Concert.new(concert_params)
 
    if @concert.save
      redirect_to @concert
    else
      render 'new'
    end
  end
 
  def update
    @concert = Concert.find(params[:id])
 
    if @concert.update(concert_params)
      redirect_to @concert
    else
      render 'edit'
    end
  end
 
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
 
    redirect_to concerts_path
  end
 
  private
    def concert_params
      params.require(:concert).permit(:name, :date,  setlists_attributes: [:id, :concert_id, :song_id, :position])
    end
end

