class UpdateCashBalanceColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :cash_balance, :float, default: 5000.00, null: false
  end
end
