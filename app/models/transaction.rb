class Transaction < ApplicationRecord
  validates :quantity, :price, presence: true, numericality: { other_than: 0 }

  belongs_to :user
  belongs_to :stock

  scope :history, -> (user) { includes(:stock).where(user_id: user.id) }
end
