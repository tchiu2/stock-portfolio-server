class TransactionsController < ApplicationController
  def index
    transactions = Transaction.history(current_user)
    render_resources(transactions)
  end

  def create
    transaction = TransactionBuilder.build(transaction_params, current_user.id)
    total_amount = transaction.quantity.abs * transaction.price

    if total_amount > current_user.cash_balance
      transaction.errors.add(:balance, "too low to place this order")
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
end
