require 'open-uri'

class PortfolioUpdater
  def initialize(portfolio)
    @portfolio = portfolio
  end

  def update
    symbols = @portfolio.keys.join(",")
    response = URI.parse("https://api.iextrading.com/1.0/stock/market/batch?symbols=#{symbols}&types=quote").read
    json = JSON.parse(response)
    
    @portfolio.each do |k, v|
      @portfolio[k] = { 
        name: json[k.to_s]["quote"]["companyName"],
        shares: v,
        value: v * json[k.to_s]["quote"]["latestPrice"],
      }
    end

    @portfolio
  end
end
