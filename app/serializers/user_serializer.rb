class UserSerializer < ActiveModel::Serializer
  attributes :summoner_name, :region, :solo_queue_rank, :flex_queue_rank
end
