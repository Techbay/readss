module Youtube
  class Base
    def initialize
    end

    def videos
      videos = Yt::Collections::Videos.new
      puts videos.where(order: 'viewCount').first.title
      puts videos.where(q: 'Fullscreen CreatorPlatform', safe_search: 'none').size
      # videos.where(chart: 'mostPopular', video_category_id: 44).first.title
      # videos.where(id: 'MESycYJytkU,invalid').map(&:title)
    end

    private
    def init_api
    end
  end
end
