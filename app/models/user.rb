class User < ApplicationRecord
  has_many :teams
  has_many :memberships
  has_many :active_teams, through: :memberships, source: :team
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
