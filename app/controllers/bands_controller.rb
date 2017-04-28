class BandsController < ApplicationController
  def index
    @bands = Band.all
  end
 
  def show
    @band = Band.find(params[:id])
  end
 
  def new
    @band = Band.new
    #@band = @artist.bands.build

  end
 
  def edit
    @band = Band.find(params[:id])

  end
 
  def create
    #@band = Band.new(band_params)
    #band.song =@song
    @group = Artist.find(params[:artist_id])
    @band = @group.bands.create(band_params)

    if @band.save
      redirect_to artist_path(@group)
    else
 
     @artist = Artist.find(params[:artist_id])
     render 'artists/show'
    end
  end

  def update
    @group = Artist.find(params[:artist_id])
    @band = @group.find(params[:id])
    if @band.update(band_params)
      redirect_to_edit_artist_path(@group)
    else 
      render 'edit' 
    end
  end

  private
    def band_params
      params.require(:band).permit(:individual_id, :group_id, :joining,:leaving)
    end
end
