class Company < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
