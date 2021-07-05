class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :summoner_name, :bio, :region, :champ_mastery, :rank, :teams, :active_teams
end
