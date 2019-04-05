class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_many :transactions
end
