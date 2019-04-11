class Stock < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true

  has_many :transactions

  scope :filter, -> (symbol) { where('symbol ILIKE ?', "%#{symbol}%").limit(25) }
end
