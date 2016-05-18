module Youku
  require 'uri'
  class Base
    def self.playlists
      url = 'https://openapi.youku.com/v2/playlists/by_user.json?client_id=1e5dd60caa432814&user_id=优酷用户1463531304330299'
      url = URI::escape(url)
      response = HTTParty.get(url)
      playlists_json = response.parsed_response
    end

    def self.videos
      url = 'https://openapi.youku.com/v2/videos/by_user.json?client_id=1e5dd60caa432814&user_id=优酷用户1463531304330299'
      url = URI::escape(url)
      response = HTTParty.get(url)
      videos_json = response.parsed_response
    end
  end
end