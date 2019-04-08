class RenameStockTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :stocks, :type, :stock_type
  end
end
