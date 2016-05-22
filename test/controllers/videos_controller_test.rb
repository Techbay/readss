require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @video = videos(:one)
    user = {email: users(:test_user).email, password: "12345678"}
    sign_in(user)
  end


  test "should get index" do
    get videos_url
    assert_response :success
  end

  test "should get new" do
    get new_video_url
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post videos_url, params: { video: { summary: @video.summary, title: @video.title } }
    end

    assert_redirected_to video_path(Video.last)
  end

  test "should show video" do
    get video_url(@video)
    assert_response :success
  end

  test "should get edit" do
    get edit_video_url(@video)
    assert_response :success
  end

  test "should update video" do
    patch video_url(@video), params: { video: { summary: @video.summary, title: @video.title } }
    assert_redirected_to video_path(@video)
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete video_url(@video)
    end

    assert_redirected_to videos_path
  end
  
  test "should subtract point after redeem" do
    
     assert_difference('users(:test_user).reward', -1) do
       post video_redeem_path params: {id: @video.id}
       users(:test_user).reload
     end
     
     users(:test_user).update(reward: 0)
     users(:test_user).reload
     assert_no_difference 'users(:test_user).reward' do
       post video_redeem_path params: {id: @video.id}
     end
  end
  
  test "should add video after redeem" do
     # should add video
     assert_difference('users(:test_user).videos.count', 1) do
       post video_redeem_path params: {id: @video.id}
       users(:test_user).reload
     end
     
     # should not add the same video 
     assert_no_difference('users(:test_user).videos.count') do
       post video_redeem_path params: {id: @video.id}
       users(:test_user).reload
     end
  end
  
  
end
