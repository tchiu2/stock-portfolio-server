class Transaction < ApplicationRecord
  validates :quantity, :price, presence: true

  belongs_to :user
  belongs_to :stock
end
