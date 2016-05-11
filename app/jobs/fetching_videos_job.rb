class FetchingVideosJob < ApplicationJob
  queue_as :videos

  def perform(list)
    list.fetching_videos
  end
end
