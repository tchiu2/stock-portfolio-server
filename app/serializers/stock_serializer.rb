class StockSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :name
end
