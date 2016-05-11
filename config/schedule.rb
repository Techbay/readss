set :environment, 'production'
set :bundle_command, "/home/deploy/.rbenv/shims/bundle exec"
set :output, {:error => 'log/error.log', :standard => 'log/cron.log'}
set :verbose_mode, true

every :hour, :roles => [:web] do
  rake "jobs:fetching_videos"
end
