class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.includes(:stock).where(user_id: params[:user_id])
    render json: @transactions, adapter: :json, key_transform: :camel_lower, status: 200
  end

  def create
    details = TransactionPricer.new(transaction_params, current_user).price
    transaction = Transaction.new(details)
    total_amount = details["quantity"].to_i * details["price"].to_f

    if total_amount > current_user.cash_balance
      transaction.errors.add(:balance, "too low to place this order")
    else
      transaction.save
      current_user.update(cash_balance: current_user.cash_balance - total_amount)
    end
    render_resource(transaction)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:symbol, :buy_sell, :quantity)
  end
end
