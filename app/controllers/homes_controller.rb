class HomesController < ApplicationController
  def top
    
  end
  
  def unsubscribe
    @end_user = EndUser.find(params[:id])
  end
  
  def withdraw
    @end_user = current_end_user
    @end_user.update(is_delete: true)
    reset_session
    redirect_to root_path
  end
end
