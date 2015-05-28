module MusicHelper
    
    def current_song
        @current_song = Music.find(params[:id])
    end
end
