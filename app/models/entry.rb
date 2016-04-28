class Entry < ApplicationRecord

  def self.fetch_entries
    items = Youtube::Base.playlist_items
    items.each do |i|
    end
  end

end
