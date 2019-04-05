class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :stock_id, null: false
      t.integer :user_id, null: false
      t.integer :quantity, null: false
      t.float :price, null: false
      t.timestamps
    end

    add_index :transactions, :user_id
  end
end
