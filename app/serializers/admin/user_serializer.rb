class Admin::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :token
end
