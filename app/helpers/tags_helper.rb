module TagsHelper
  def show_tags(video)
      tags_link = []
      video.tags.each do |t|
          tags_link.append(link_to(t.name, "#", :class => "tag"))
          if user_signed_in?
            tags_link.append(tag_subscribe_link(t))
          end
      end
      tags_link.join(" ")
  end
  
  def tag_subscribe_link(tag)
    options = {action: :subscribe, controller: :tags, id: tag.id.to_s, remote: true}
    html_options = {class: "subscribe_tag", id: "subscribe_" + tag.id.to_s, method: :post}
    if (current_user.tags.exists?(tag.id))
      link_to "-|", options, html_options
    else
      link_to "+|", options, html_options
    end
      
     #class: "redeem-video", method: :post, id: "redeem_", title: t('commit_box_title', default: "Subscription"),
          #data: {video_id: video.id, confirm: "It costs 1 point to watch #{video.title.upcase}. You have #{current_user.reward} points as of now.",
          #data: {remote: true, video_id: 1, confirm: "Please confirm",
          #     cancel: t('cancel', default:'Cancel'), commit: t('commit', default: 'Confirm'),
          #       turbolinks: true}
  end
end