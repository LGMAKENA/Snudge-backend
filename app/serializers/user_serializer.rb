class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username, :email, :role
end
