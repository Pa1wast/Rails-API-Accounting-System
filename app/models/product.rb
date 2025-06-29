class Product < ApplicationRecord
  belongs_to :company
  has_many :transactions, dependent: :destroy

  def quantity_sold
    transactions.where(transaction_type: 'sell').sum('quantity')
  end

  def quantity_bought
    transactions.where(transaction_type: 'buy').sum('quantity')
  end

  def as_json(options = {})
  super(options.merge(methods: [:quantity_sold, :quantity_bought]))
end

end
