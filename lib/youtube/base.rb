module Youtube
  class Base
    def self.videos
      videos = Yt::Collections::Videos.new
      videos.where(order: 'viewCount').first(5)
    end

    def self.playlist_items(list_id)
      playlist = Yt::Playlist.new id: list_id
      playlist.playlist_items
    end

    private
  end
end
