require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  module ClassMethodTest
    def test_videos
      videos = ::Youtube::Base.videos
      assert videos.is_a?(Array)
    end
  end

  module InstanceMethodTest
  end

  include ClassMethodTest
  include InstanceMethodTest

end
