class ApplicationController < ActionController::Base

  private
  def user_params
    params.require(:user).permit(:name, :username, :user_id, :group_id, :created_at, :avatar)
  end
  
end
