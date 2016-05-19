# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string
#  rid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord
  validates :name, :rid, presence: true, uniqueness: true
  enum source_type: {youtube: 0, vimeo: 1, youku: 2}

  def fetching_videos
    Video.fetching_videos(self)
  end
end
