class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :code, :user
end
