module Youtube
  class Base
    def initialize
    end

    def self.videos
      videos = Yt::Collections::Videos.new
      videos.where(order: 'viewCount').first(5)
      # puts videos.where(q: 'Fullscreen CreatorPlatform', safe_search: 'none').size
      # videos.where(chart: 'mostPopular', video_category_id: 44).first.title
      # videos.where(id: 'MESycYJytkU,invalid').map(&:title)
    end

    def self.playlist_items
      playlist = Yt::Playlist.new id:  'PLHb9DprH7bWATmIhJuNKUJLIIDU8FTlHG'
      playlist.playlist_items
    end

    private
    def init_api
    end
  end
end
