class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :billboard_songs, :edit, :update, :destroy]

  def index
    @billboards = Billboard.all  
  end

  def show
    # @allsongs = Song.all #all songs period
    @selected_songs = Song.where(billboard_id: @billboard.id)
    @all_available_songs = Song.where(billboard_id: nil) #all songs not attached to this billboard
    # @songs = @billboard.songs #all songs attached to this billboard
  end

  def billboard_songs
    # loop through and update the songs to have the billboard id
    if params[:selected_songs]
      Song.where(id: params[:selected_song_ids]).update_all(billboard_id: nil)
    else
      Song.where(id: params[:song_ids]).update_all(billboard_id: @billboard.id)
    end
    redirect_to billboard_path(@billboard.id)
  end

  def new
    @billboard = Billboard.new 
  end

  def edit
  end

  def create 
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboards_path
    else 
      render :new
    end 
  end 

  def update 
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else 
      render :edit 
    end 
  end 

  def destroy 
    @billboard.destroy
    redirect_to billboards_path
  end 


  private

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end 

  def billboard_params
    params.require(:billboard).permit(:name)
  end 
  
end
