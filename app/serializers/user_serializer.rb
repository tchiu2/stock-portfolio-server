class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :positions
end
