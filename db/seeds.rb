User.create(email: "test@techbay.com", password: "12345678", reward: 10, isadmin: true)
List.create(name: "programming", rid: "PLxsn9ryMcqFRaF8rXgwkwb6SMzBNWhCri")
List.create(name: "test", rid: "27270192")

# Suppose we use youtube
List.all.each do |l|
  l.fetching_videos
end
