class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :summoner_name, :bio, :region
end
