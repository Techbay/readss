class FetchingVideosJob < ApplicationJob
  queue_as :default

  def perform(list)
    list.fetching_videos
  end
end
