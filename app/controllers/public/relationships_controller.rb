class Public::RelationshipsController < ApplicationController
  before_action :authenticate_end_user!
  
  def create
    @end_user = EndUser.find(params[:end_user_id])
    following = current_end_user.relationships.build(follower_id: params[:end_user_id])
    following.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @end_user = EndUser.find(params[:end_user_id])
    following = current_end_user.relationships.find_by(follower_id: params[:end_user_id])
    following.destroy
    redirect_back(fallback_location: root_path)
    
  end
end
