class StocksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    stocks = Stock.filter(params[:filter])
    render_resources(stocks)
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
