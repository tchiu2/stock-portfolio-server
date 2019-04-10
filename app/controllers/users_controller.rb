class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render_resource(user)
  end

  def portfolio
    user = User.find(params[:user_id])
    portfolio = PortfolioBuilder.build(user.positions)
    render json: portfolio
  end
end
