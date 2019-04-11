module PortfolioBuilder
  def self.build(positions)
    return positions if positions.empty?

    symbols = positions.keys.join(",")
    quotes = Iex::Client.quotes(symbols)
    
    positions.reduce({}) do |acc, (k, v)|
      quote = quotes[k.to_s]["quote"]

      acc.merge(k => { 
        symbol: k,
        name: quote["companyName"],
        shares: v,
        price: quote["latestPrice"],
        value: v * quote["latestPrice"],
        change: quote["change"],
        changePct: quote["changePercent"],
      })
    end
  end
end
