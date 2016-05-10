namespace :jobs do
  task fetching_videos: :environment do
    List.all.each do |l|
      FetchingVideosJob.new.perform(l)
    end
  end
end
