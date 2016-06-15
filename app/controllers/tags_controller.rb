class TagsController < ApplicationController
  before_action :set_tag
  before_action :authenticate_user!
  protect_from_forgery #except: :subscribe

    
  # subscription
  def subscribe
    flash[:subscribe]={}
    if current_user.tags.exists?(@tag.id)
      current_user.tags.delete(@tag.id)
      flash[:subscribe][:success] = @tag.name + " is unsubscribed"
    else
      current_user.tags << @tag 
      flash[:subscribe][:success] = @tag.name + " is subscribed"
    end
    respond_to do |format|
      format.html { redirect_to videos_path }
      format.js {}
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
