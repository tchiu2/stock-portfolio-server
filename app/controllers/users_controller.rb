class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :portfolio]

  def show
    render json: { payload: "Show" }, status: :success
  end

  def portfolio
    render json: { payload: "Portfolio" }, status: :success
  end
end
