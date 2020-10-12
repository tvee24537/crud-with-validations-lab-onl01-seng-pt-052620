class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create   
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @songs = Song.all

    @song.destroy
    redirect_to songs_url
  end

  def show
  end

  private
  
  def song_params
    params[:song].permit(:title, :released, :release_year, :artist_name, :genre)
  end

    def set_song!
    @song = Song.find(params[:id])
  end

end