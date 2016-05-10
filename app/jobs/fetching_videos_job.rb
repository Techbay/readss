class FetchingVideosJob < ApplicationJob
  queue_as :default

  def perform(*args)
    List.all.each do |l|
      l.fetching_videos
    end
  end
end
