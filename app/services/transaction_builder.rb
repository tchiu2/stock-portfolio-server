require 'open-uri'

module TransactionBuilder
  def self.build(transaction, user_id)
    stock = Stock.find_by(symbol: transaction["symbol"])

    return Transaction.new(quantity: 0, price: 0) unless stock

    Transaction.new(
      stock_id: stock.id,
      user_id: user_id,
      price: Iex::Client.price(transaction["symbol"]),
      quantity: transaction["quantity"].to_i * (transaction["buy_sell"] == "buy" ? 1 : -1)
    )
  end
end
