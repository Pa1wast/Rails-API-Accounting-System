class AddCompanyToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_reference :transactions, :company, null: false, foreign_key: true
  end
end
