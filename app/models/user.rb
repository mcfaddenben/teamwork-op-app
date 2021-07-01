class User < ApplicationRecord
  has_many :teams
  has_many :memberships
  has_many :active_teams, through: :memberships, source: :team
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def summoner_info
    info = HTTP.get("https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}?api_key=#{Rails.application.credentials.riot_api_key}")
    return info.parse(:json)
  end

  def rank_data
    rank_data = HTTP.get("https://na1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{summoner_info["id"]}?api_key=#{Rails.application.credentials.riot_api_key}")
    return rank_data.parse(:json)
  end

  def mastery_full
    mastery_full = HTTP.get("https://na1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/#{summoner_info["id"]}?api_key=#{Rails.application.credentials.riot_api_key}")
    return mastery_full.parse(:json)
  end

  def champ_mastery
    mastery = []
    i = 0
    5.times do
      mastery << mastery_full[i]["championId"]
      mastery << "Champion Level #{mastery_full[i]["championLevel"]}"
      i += 1
    end
    return mastery
  end

  def solo_queue_rank
    response = "#{rank_data[0]["tier"]}, #{rank_data[0]["rank"]}"
    if response == nil
      return "summoner is unranked in solo queue"
    else
      return response
    end
  end

  def flex_queue_rank
    response = "#{rank_data[1]["tier"]}, #{rank_data[1]["rank"]}"
    if response
      return response
    else
      return "Unranked in flex queue"
    end
  end
end
