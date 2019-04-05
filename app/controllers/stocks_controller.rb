class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    render json: Stock.all
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
