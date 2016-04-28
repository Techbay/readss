module Vimeo
  class Base
    def initialize
    end

    def self.get_videos_from_channel(channel)
      channel ||= "documentaryfilm"
      videos = Vimeo::Simple::Channel.videos(channel)
    end

    def self.video(video_id)
      video_id ||= "120206922"
      Vimeo::Simple::Video.info(video_id)
    end
  end
end
