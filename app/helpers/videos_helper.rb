module VideosHelper
  # show if the video is redeemed or not
  def video_redeem_status(video)
    unless video.is_pro
      return show_link(video)
    end

    if user_signed_in?
      if current_user.videos.include?(video)
        show_link(video)
      else
        link_to "redeem",
          video_redeem_path(id: video.id),
          class: "redeem-video", method: :post, remote: true, id: "redeem_"+video.id.to_s,
          data: {video_id: video.id, confirm: "It costs 1 point to watch #{video.title.upcase}. You have #{current_user.reward} points as of now.", 
              verify: current_user.reward-1, verify_text: "Please answer how many point you have remaining after watching the video.", turbolinks: true}
      end
    end
  end

  # generate the video thumbnail or embedded video
  def video_content(video)
    if video.is_pro
      show_pro_video(video)
    else
      raw video.embed_html
    end
  end

  private
  def show_pro_video(video)
    if user_signed_in? and current_user.videos.include?(video)
      raw video.embed_html
    else
      image_tag(video.thumbnail_url || "administrate/search.svg", alt: "READSS")
    end
  end

  def show_link(video)
    content_tag :a, "show", {id: "show_"+video.id.to_s, class: "show-video", href: video_path(video), style: "color: blue", data: {name: "", remote: true}}
  end
end
