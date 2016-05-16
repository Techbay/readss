module VideosHelper
  # show if the video is redeemed or not
  def video_redeem_status(video)
    return unless video.is_pro

    if user_signed_in?
      if current_user.videos.include?(video)
        content_tag :span, "You have purchased this video!", {style: "color: blue"}
      else
        link_to "兑换",
          video_redeem_path(id: video.id),
          class: "redeem-video", method: :post,
          data: {video_id: video.id, confirm: "Click OK to use your reward to watch " + video.title.upcase, turbolinks: true}
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
end
