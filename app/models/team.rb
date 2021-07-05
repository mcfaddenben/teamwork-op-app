class Team < ApplicationRecord
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
