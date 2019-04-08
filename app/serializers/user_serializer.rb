class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :cash_balance
end
