class StocksController < ApplicationController
  def index
    stocks = Stock.filter(params[:filter])
    render_resources(stocks)
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
