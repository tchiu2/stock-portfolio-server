class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    render json: Stock.all, adapter: :json, status: 200
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
