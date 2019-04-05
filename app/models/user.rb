class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :cash_balance, presence: true

  has_many :transactions
  has_many :stocks,
    through: :transactions,
    source: :stock

  def positions 
    self.transactions.joins(:stock).group(:symbol).sum(:quantity)
  end
end
