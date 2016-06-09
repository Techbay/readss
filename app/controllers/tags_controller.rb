class TagsController < ApplicationController
  #before_action :set_tag
  #before_action :authenticate_user!
  #protect_from_forgery #except: :subscribe

    
  # subscription
  def subscribe
    flash[:subscribe]={}
    flash[:subscribe][:success] = "ok"
    respond_to do |format|
      format.html { redirect_to videos_path }
      format.js 
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
