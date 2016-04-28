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

require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  setup do
    StubVideos = Struct.new(:title, :summary, :duration)
    @playlist = [
      StubVideos.new('test_title', 'test_summary', 123)
    ]
  end

  module ClassMethodTest
    def test_fetching_videos
      ::Youtube::Base.stub :playlist_items, @playlist do
        assert_difference('Video.count', @playlist.count) do
          Video.fetching_videos
        end
      end
    end
  end

  module InstanceMethodTest
  end

  include ClassMethodTest
  include InstanceMethodTest

end
