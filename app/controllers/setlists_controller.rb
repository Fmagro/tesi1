class SetlistsController < ApplicationController
  def index
    @setlists = Setlist.all
  end
 
  def show
    @setlist = Setlist.find(params[:id])
  end
 
  def new
    @setlist = Setlist.new
    #@setlist = @concert.setlists.build

  end
 
  def edit
    @setlist = Setlist.find(params[:id])

  end
 
  def create
    #@setlist = Setlist.new(setlist_params)
    #setlist.song =@song
    @concert = Concert.find(params[:concert_id])
    @setlist = @concert.setlists.create(setlist_params)
    @setlist.position = @concert.setlists.count+1

 

    if @setlist.save
      redirect_to concert_path(@concert)
    else
      @concert = Concert.find(params[:concert_id])
      render 'concerts/show'
    end
  end
 
  def update
    #@setlist = Setlist.find(params[:id])
    @concert = Concert.find(params[:concert_id])
    @setlist = @concert.setlist.find(params[:id])
    

    if @setlist.update(setlist_params)
      redirect_to edit_concert_path(@concert)
    else
      render 'edit'
    end
  end
 
  def destroy
    @setlist = Setlist.find(params[:id])
    @setlist.destroy
 
    redirect_to setlists_path
  end
 
  private
    def setlist_params
      params.require(:setlist).permit(:concert_id, :song_id,:position)
    end
end
