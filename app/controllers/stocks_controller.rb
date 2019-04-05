class StocksController < ApplicationController
  private

  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
