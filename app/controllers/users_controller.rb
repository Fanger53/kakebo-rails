class UsersController < ApplicationController
  before_action :authenticate_user!
  def home

    @income = Income.new
    @transfer = Transfer.new
    @group = Group.new

    @data_transfer_keys = ['Transfers']
    sum_values_transfers = current_user.transfers.all.map(&:amount).sum
    @data_transfers_values = [sum_values_transfers]

    @data_income_keys = ['Incomes']
    sum_values_incomes = current_user.incomes.all.map(&:amount).sum
    @data_incomes_values = [sum_values_incomes]

    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :user_id, :group_id, :created_at, :avatar)
  end
end
