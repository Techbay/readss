Yt.configure do |config|
  config.client_id = ENV["G_CLIENT_ID"]
  config.client_secret = ENV["G_SECRET"]
  config.api_key = ENV["G_API_KEY"]
  config.log_level = :debug
end
