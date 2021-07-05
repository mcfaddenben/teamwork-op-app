class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :user_id, :about, :memberships, :users
end
