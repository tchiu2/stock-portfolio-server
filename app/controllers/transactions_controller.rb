class TransactionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @transactions = Transaction.where(user_id: params[:user_id])
    render json: @transactions, adapter: :json, key_transform: :camel_lower, status: 200
  end
end
