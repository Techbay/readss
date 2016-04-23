json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :summary
  json.url entry_url(entry, format: :json)
end
