class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.integer :pricePerUnit
      t.integer :quantity
      t.integer :expenses
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
