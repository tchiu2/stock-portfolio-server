require 'open-uri'

module Iex
  module Client
    def self.get(endpoint)
      JSON.parse(URI.open("https://api.iextrading.com/1.0/#{endpoint}").read)
    end

    def self.symbols
      self.get("/ref-data/symbols")
    end

    def self.quotes(symbols)
      self.get("/stock/market/batch?types=quote&symbols=#{symbols}")
    end

    def self.price(symbol)
      self.get("/stock/#{symbol}/price")
    end
  end
end
