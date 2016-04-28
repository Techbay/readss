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
      create!(title: i.title, summary: i.summary)
    end
  end

end
