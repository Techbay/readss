User.create(email: "test@techbay.com", password: "12345678", isadmin: true)
List.create(name: "programming", rid: "PLxsn9ryMcqFRaF8rXgwkwb6SMzBNWhCri")

# Suppose we use youtube
List.all.each do |l|
  l.fetching_videos
end
