User.create(email: "test@techbay.com", password: "12345678", reward: 10, isadmin: true)
List.create(name: "programming", rid: "PLxsn9ryMcqFRaF8rXgwkwb6SMzBNWhCri", source_type: "youtube")
List.create(name: "test", rid: "27270192", source_type: "youku")
Tag.create(name: "rails")
Tag.create(name: "html")
# Suppose we use youtube
List.all.each do |l|
  l.fetching_videos
end
