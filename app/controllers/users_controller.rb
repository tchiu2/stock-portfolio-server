class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    render json: @user, adapter: :json, status: 200
  end
end
