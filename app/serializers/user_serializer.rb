class UserSerializer < ActiveModel::Serializer
  attributes :summoner_name, :region, :rank_data, :mastery_data
end
