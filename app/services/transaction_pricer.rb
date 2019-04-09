require 'open-uri'

class TransactionPricer
  def initialize(transaction, current_user)
    @transaction = transaction
    @current_user = current_user
  end

  def price
    return @transaction if @transaction.empty?

    @transaction["price"] = URI.parse("https://api.iextrading.com/1.0/stock/#{@transaction["symbol"]}/price").read
    @transaction["stock_id"] = Stock.find_by(symbol: @transaction["symbol"]).id
    @transaction["user_id"] = @current_user.id
    @transaction["quantity"] = @transaction["quantity"].to_i * (@transaction["buy_sell"] == "buy" ? 1 : -1)
    @transaction.delete("buy_sell")
    @transaction.delete("symbol")

    @transaction
  end
end
