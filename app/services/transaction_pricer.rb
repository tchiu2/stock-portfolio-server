require 'open-uri'

class TransactionPricer
  def initialize(transaction, current_user)
    @transaction = transaction
    @current_user = current_user
  end

  def price
    if @transaction["symbol"].empty? || @transaction["quantity"].empty?
      @transaction["stock_id"] = Stock.find_by(symbol: @transaction["symbol"]).id unless @transaction["symbol"].empty?
    else
      stock = Stock.find_by(symbol: @transaction["symbol"])
      if stock
        @transaction["stock_id"] = stock.id
        @transaction["user_id"] = @current_user.id
        @transaction["price"] = URI.parse("https://api.iextrading.com/1.0/stock/#{@transaction["symbol"]}/price").read
      end

      @transaction["quantity"] = @transaction["quantity"].to_i * (@transaction["buy_sell"] == "buy" ? 1 : -1)
    end

    @transaction.delete("buy_sell")
    @transaction.delete("symbol")
    @transaction
  end
end
