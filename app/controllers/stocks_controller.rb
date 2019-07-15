class StocksController < ApplicationController
  def index
    stocks = Stock.filter(params[:filter])
    render_resources(stocks)
  end

  def chart
    chart = Iex::Client.chart(params[:symbol], params[:range])
    render json: chart
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
