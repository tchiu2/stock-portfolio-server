class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show, :portfolio]

  def show
    @user = User.find(params[:id])
    render json: @user, adapter: :json, key_transform: :camel_lower, status: 200
  end

  def portfolio
    @user = User.find(params[:user_id])
    portfolio = PortfolioUpdater.new(@user.positions).update
    render json: portfolio
  end
end
