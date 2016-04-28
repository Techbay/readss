class Video < ApplicationRecord

  def self.fetching_videos
    items = Youtube::Base.playlist_items
    items.each do |i|
    end
  end

end
