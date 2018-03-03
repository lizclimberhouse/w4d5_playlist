class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit, :destroy]

    def index
      @songs = Song.new
    end
  
    def show
    end
  
    def new
      @song = Song.new
    end
  
    def edit
    end
  
    def create
      @song = current_account.songs.new(song_params)
      if @song.save
        flash[:success] = 'song created!'
        redirect_to songs_path
      else
        flash[:error] = "Error: #{@song.errors.full_messages.join("/n")}"
        render :new
      end
    end
  
    def update
      if @song.update(song_params)
        redirect_to songs_path
      else
        render :edit
      end
    end
  
    def destroy
      @song.destroy
      flash[:success] = 'song Deleted!'
      redirect_to songs_path
    end
  
    private
  
      def song_params
        params.require(:song).permit(:name, :balance)
      end
  
      def set_song
        @song = current_account.songs.find(params[:id])
      end

end
