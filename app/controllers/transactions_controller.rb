class TransactionsController < ApplicationController
  def index
    transactions = Transaction.history(current_user)
    render_resources(transactions)
  end

  def create
    transaction = TransactionBuilder.build(transaction_params, current_user.id)
    total_amount = transaction.quantity * transaction.price

    portfolio = PortfolioBuilder.build(current_user.positions)[transaction_params[:symbol]]
    current_position = portfolio && portfolio[:shares]

    if total_amount > current_user.cash_balance
      transaction.errors.add(:balance, "too low to place this order")
    elsif sign == "sell" && (!current_position || current_position < quantity)
      transaction.errors.add(:quantity, "greater than currently owned quantity")
    else
      transaction.save
      current_user.update(cash_balance: current_user.cash_balance - total_amount)
    end
    render_resource(transaction)
  end

  def price
    price = Iex::Client.price(params['symbol'])
    render plain: "#{price}"
  end

  private

  def transaction_params
    params.require(:transaction).permit(:symbol, :buy_sell, :quantity)
  end

  def sign
    transaction_params[:buy_sell]
  end

  def quantity
    transaction_params[:quantity].to_i
  end
end
