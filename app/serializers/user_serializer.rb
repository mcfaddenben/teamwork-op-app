class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :summoner_name, :bio, :region, :rank_data, :summoner_info
end
