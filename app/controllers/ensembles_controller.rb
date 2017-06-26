class EnsemblesController < ApplicationController
  def index
    @ensembles = Ensemble.all
  end
 
  def show
    @ensemble = Ensemble.find(params[:id])
  end
 
  def new
    @ensemble = Ensemble.new
    #@ensemble = @performer.ensembles.build

  end
 
  def edit
    @ensemble = Ensemble.find(params[:id])

  end
 
  def create
    #@ensemble = Ensemble.new(ensemble_params)
    #ensemble.song =@song
    @group = Performer.find(params[:group_id])
    @ensemble = @group.ensembles.create(ensemble_params)

    if @ensemble.save
      redirect_to performer_path(@group)
    else
 
     @performer = Performer.find(params[:group_id])
     render 'performers/show'
    end
  end

  def update
    @group = Performer.find(params[:performer_id])
    @ensemble = @group.find(params[:id])
    if @ensemble.update(ensemble_params)
      redirect_to_edit_performer_path(@group)
    else 
      render 'edit' 
    end
  end

  private
    def ensemble_params
      params.require(:ensemble).permit(:individual_id, :group_id, :joining,:leaving)
    end
end
