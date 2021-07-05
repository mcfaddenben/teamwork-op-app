class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :primary_role, :secondary_role, :fill, :assigned_role
  belongs_to :user
end
