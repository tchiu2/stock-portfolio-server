class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @transactions = Transaction.includes(:stock).where(user_id: params[:user_id])
    render json: @transactions, adapter: :json, key_transform: :camel_lower, status: 200
  end

  def create
    details = TransactionPricer.new(transaction_params, current_user).price
    transaction = Transaction.new(details)
    if details["quantity"].to_i * details["price"].to_f > current_user.cash_balance
      transaction.errors.add(:balance, "Insufficient funds to place this order")
      validation_error(transaction)
    else
      render json: transaction, adapter: :json, key_transform: :camel_lower, status: 200
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:symbol, :buy_sell, :quantity)
  end
end
