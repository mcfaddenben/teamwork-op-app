class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :about, :user_id
  has_many :memberships
end
