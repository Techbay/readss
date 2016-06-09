module TagsHelper
  def show_tags(video)
      tags = video.tags.map {|t| t.name}
      tags_link = []
      tags.join(" ")
      tags.each do |t|
          tags_link.append(link_to t, "#")
          if user_signed_in?
            tags_link.append(tag_subscribe_link(t))
          end
      end
      tags_link.join(" ")
  end
  
  def tag_subscribe_link(tag)
    link_to "+", tag_subscribe_path(id: "1"), method: :post, class: "subscribe_tag", remote: true
     #class: "redeem-video", method: :post, id: "redeem_", title: t('commit_box_title', default: "Subscription"),
          #data: {video_id: video.id, confirm: "It costs 1 point to watch #{video.title.upcase}. You have #{current_user.reward} points as of now.",
          #data: {remote: true, video_id: 1, confirm: "Please confirm",
          #     cancel: t('cancel', default:'Cancel'), commit: t('commit', default: 'Confirm'),
          #       turbolinks: true}
  end
end