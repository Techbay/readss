User.find_or_create_by(email: "test@techbay.com").update(password: "12345678", reward: 10, isadmin: true)
List.find_or_create_by(rid: "PLxsn9ryMcqFRaF8rXgwkwb6SMzBNWhCri").update(name: "programming", source_type: "youtube")
List.find_or_create_by(rid: "27270192").update(name: "test", source_type: "youku")
Tag.create(name: "rails")
Tag.create(name: "html")

# Suppose we use youtube
List.all.each do |l|
  l.fetching_videos
end

# set pro to the first video
Video.first.update(is_pro: true)
Video.first.tags << Tag.first