class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @user_avatar = current_user.avatar
  end
  private
  def user_params
    params.require(:user).permit(:name, :username, :user_id, :group_id, :created_at, :avatar)
  end
end
