class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :team_id, :primary_role, :secondary_role, :fill, :assigned_role
end
