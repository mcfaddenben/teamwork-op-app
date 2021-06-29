class User < ApplicationRecord
  has_many :teams
  has_many :memberships
  has_many :active_teams, through: :memberships, source: :team
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def summoner_info
    response = HTTP.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}?api_key=RGAPI-d5799216-73eb-40e6-b1fa-b0929d0cddec")
    return response.parse(:json)
  end

  def rank_data
    rank_data = HTTP.get("https://na1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{summoner_info["id"]}?api_key=RGAPI-d5799216-73eb-40e6-b1fa-b0929d0cddec")
    return rank_data.parse(:json)
  end

  def mastery_data
    mastery_data = HTTP.get("https://na1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{summoner_info["id"]}?api_key=RGAPI-d5799216-73eb-40e6-b1fa-b0929d0cddec")
    return mastery_data.parse(:json)
  end
end
