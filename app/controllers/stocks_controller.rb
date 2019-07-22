class StocksController < ApplicationController
  def index
    stocks = Stock.filter(params[:filter])
    render_resources(stocks)
  end

  def chart
    chart = Iex::Client.chart(params[:symbol], params[:range])
    name = Stock.find_by(symbol: params[:symbol].upcase).name
    render json: { chart: chart, name: name }
  end
  
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
