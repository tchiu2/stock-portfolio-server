class RemoveNameNullValidationFromStocks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :stocks, :name, true
  end
end
