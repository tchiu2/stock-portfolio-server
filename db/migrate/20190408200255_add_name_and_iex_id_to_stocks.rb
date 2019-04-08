class AddNameAndIexIdToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :name, :string, null: false
    add_column :stocks, :iex_id, :integer, null: false
    add_column :stocks, :type, :string, null: false
    add_column :stocks, :enabled, :boolean, null: false

    add_index :stocks, :iex_id, unique: true
  end

end
