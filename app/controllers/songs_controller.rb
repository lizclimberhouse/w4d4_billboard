class SongsController < ApplicationController
  before_action :set_artist # needs to be before if we need it in the set_song
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = @artist.songs.new #because it has_many relationship
  end

  def edit
  end

  def create
    @song = @artist.songs.new(song_params)

    if @song.save
      redirect_to artist_song_path(@artist, @song)
      # redirect_to [@artist, @song] same same ^
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path(@artist, @song)
      # redirect_to [@artist, @song] # same same ^
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to artist_songs_path # go back to the list of all of songs
  end

  private
    def set_artist
      @artist = artist.find(params[:artist_id])
    end

    def set_song
      @song = song.find(params[:id])
    end

    def song_params 
      params.require(:song).permit(:title, :lyrics)
    end
end
