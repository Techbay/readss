# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  title          :string
#  summary        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  published_at   :date
#  thumbnail_url  :string
#  channel_id     :string
#  channel_title  :string
#  category_id    :integer
#  category_title :string
#  view_count     :integer
#  like_count     :integer
#  dislike_count  :integer
#  favorite_count :integer
#  comment_count  :integer
#  duration       :integer
#  is_hd          :boolean
#  embed_html     :string
#  video_id       :string
#  video_type     :string
#  summary_md     :string
#  is_pro         :boolean          default(FALSE)
#

class Video < ApplicationRecord
  has_and_belongs_to_many :users
  # this is done before save or update
  before_save do
    if self.summary_md_changed?
      puts "convert md to html"
      self.md_to_html!(:summary_md, :summary)
    end
  end

  def self.fetching_videos(list_id)
    items = Youtube::Base.playlist_items(list_id)
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

  def md_to_html!(from=nil, to=nil)
    raise "please tell me which field (a symbol) to convert to html" unless from.is_a?(Symbol)
    raise "please tell me which field (a symbol) to save the converted" unless to.is_a?(Symbol)
    raise "this field is not a string" unless self[from].is_a?(String)
    self[to] = self.md_to_html(self[from])
    return nil
    #self.save
  end


  # Instance methods
  # output: html rendered from input
  # If the input is already html, it seems that it's smart enough to keep it as is.
  def md_to_html(text=self.summary)
    options = {}
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
    renderer.render(text)
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
