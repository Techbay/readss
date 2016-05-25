module TagsHelper
  def show_tags(video)
      tags = video.tags.map {|t| t.name}
      tags_link = []
      tags.join(" ")
      tags.each do |t|
          tags_link.append(link_to t, "#")
      end
      tags_link.join(" ")
  end
end