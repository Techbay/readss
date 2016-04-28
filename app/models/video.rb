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
      create!(title: i.video.title, summary: i.video.description, published_at: i.video.published_at, thumbnail_url: i.video.thumbnail_url, channel_id: i.video.channel_id, channel_title: i.video.channel_title, category_id: i.video.category_id, category_title: i.video.category_title, view_count: i.video.view_count, like_count: i.video.like_count, dislike_count: i.video.dislike_count, favorite_count: i.video.favorite_count, comment_count: i.video.comment_count, duration: i.video.duration, is_hd: i.video.hd?, embed_html: i.video.embed_html)
    end
  end
end
