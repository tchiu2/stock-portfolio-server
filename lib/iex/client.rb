require 'open-uri'

module Iex
  module Client
    def self.get(endpoint)
      JSON.parse(URI.open("https://cloud.iexapis.com/stable/#{endpoint}token=#{ENV['IEX_TOKEN']}").read)
    end

    def self.symbols
      self.get("/ref-data/symbols?")
    end

    def self.quotes(symbols)
      self.get("/stock/market/batch?types=quote&symbols=#{symbols}&")
    end

    def self.price(symbol)
      self.get("/stock/#{symbol}/quote/latestPrice?")
    end

    def self.chart(symbol, range)
      self.get("/stock/#{symbol}/chart/#{range}?chartCloseOnly=true&")
    end
  end
end
