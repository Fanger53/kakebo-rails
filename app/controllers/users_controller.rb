class UsersController < ApplicationController
  before_action :authenticate_user!
  def home
    @data_keys = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
    ]
    @data_values = [0, 10, 5, 2, 20, 30, 45]
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :user_id, :group_id, :created_at, :avatar)
  end
end
