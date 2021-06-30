class User < ApplicationRecord
  has_many :teams
  has_many :memberships
  has_many :active_teams, through: :memberships, source: :team
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def summoner_info
    response = HTTP.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}?api_key=#{Rails.application.credentials.riot_api_key}")
    return response.parse(:json)
  end

  def rank_data
    rank_data = HTTP.get("https://na1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{summoner_info["id"]}?api_key=#{Rails.application.credentials.riot_api_key}")
    return rank_data.parse(:json)
  end

  def mastery_data
    mastery_data = HTTP.get("https://na1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{summoner_info["id"]}?api_key=#{Rails.application.credentials.riot_api_key}")
    return mastery_data.parse(:json)
  end

  def solo_queue_rank
    rank = "#{rank_data[0]["tier"]}, #{rank_data[0]["rank"]}"
    return rank
  end

  def flex_queue_rank
    rank = "#{rank_data[1]["tier"]}, #{rank_data[1]["rank"]}"
    return rank
  end
end
