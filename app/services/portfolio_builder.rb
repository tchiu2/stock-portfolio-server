module PortfolioBuilder
  def self.build(positions)
    return positions if positions.empty?

    symbols = positions.keys.join(",")
    quotes = Iex::Client.quotes(symbols)
    
    positions.reduce({}) do |acc, (k, v)|
      quote = quotes[k.to_s]["quote"]

      acc.merge(k => { 
        name: quote["companyName"],
        shares: v,
        value: v * quote["latestPrice"],
        change: quote["change"],
        changePct: quote["changePercent"],
      })
    end
  end
end
