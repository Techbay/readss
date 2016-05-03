# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Video < ApplicationRecord

  def self.fetching_videos
    items = Youtube::Base.playlist_items
    items.each do |i|
      video = i.video
      begin
        entry = find_or_create_by(video_id: video.id)
        entry.update(
          title: video.title,
          summary: video.description,
          video_type: "Youtube",
          published_at: video.published_at,
          thumbnail_url: video.thumbnail_url,
          channel_id: video.channel_id,
          channel_title: video.channel_title,
          category_id: video.category_id,
          category_title: video.category_title,
          view_count: video.view_count,
          like_count: video.like_count,
          dislike_count: video.dislike_count,
          favorite_count: video.favorite_count,
          comment_count: video.comment_count,
          duration: video.duration,
          is_hd: video.hd?,
          embed_html: video.embed_html)
      rescue
        next
      end
    end
  end

  private
  def self.fetch_item(items, num)
    index = 0
    items.each do |i|
      if index == num
        return i
      end
      index += 1
    end
  end
end
