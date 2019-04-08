class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :buy_sell, :quantity, :price, :trade_date

  def symbol
    self.object.stock.symbol
  end

  def buy_sell
    self.object.quantity < 0 ? "Sell" : "Buy"
  end

  def quantity
    self.object.quantity.abs
  end

  def trade_date
    self.object.created_at.to_s(:db)
  end
end
