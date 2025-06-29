class AddCascadeToCompanyForeignKeys < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :products, :companies
    add_foreign_key :products, :companies, on_delete: :cascade

    remove_foreign_key :transactions, :companies
    add_foreign_key :transactions, :companies, on_delete: :cascade
  end
end
