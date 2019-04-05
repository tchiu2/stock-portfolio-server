class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :current_holdings
end
