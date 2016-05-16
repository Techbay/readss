module VideosHelper
    # show if the video is redeemed or not
    def video_redeem_status(video)
      if user_signed_in?
        if current_user.videos.include?(video)
            content_tag :span, "You have purchased this video!", {style: "color: blue"}
        else
            link_to "兑换", video_redeem_path(id: video.id),  class: "redeem-video", method: :post, remote: true,
          data: {video_id: video.id, confirm: "Click OK to use your reward to watch " + video.title.upcase}
        end
      end
    end
    
    # generate the video thumbnail or embedded video 
    def video_content(video)
      if user_signed_in? and current_user.videos.include?(video) 
        raw video.embed_html
      else
        image_tag(video.thumbnail_url||"administrate/search.svg", alt: "READSS") 
      end
    end 
end
