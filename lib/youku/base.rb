module Youku
  require 'uri'
  class Base
    def self.playlists(list)
      list_id = list.rid
      url = 'https://openapi.youku.com/v2/playlists/videos.json?client_id=1e5dd60caa432814&playlist_id=' + list_id
      response = HTTParty.get(url)
      playlists_json = response.parsed_response
      videos = playlists_json["videos"]
    end

    def self.videos
      url = 'https://openapi.youku.com/v2/videos/by_user.json?client_id=1e5dd60caa432814&user_name=优酷用户1463531304330299'
      url = URI::escape(url)
      response = HTTParty.get(url)
      videos_json = response.parsed_response
      videos = videos_json['videos']
    end
  end
end