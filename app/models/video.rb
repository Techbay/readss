class Video < ApplicationRecord

  def self.fetch_videos
    items = Youtube::Base.playlist_items
    items.each do |i|
    end
  end

end
