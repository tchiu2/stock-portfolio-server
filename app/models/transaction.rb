class Transaction < ApplicationRecord
  validates :quantity, :price, presence: true, numericality: { other_than: 0 }

  belongs_to :user
  belongs_to :stock
end
