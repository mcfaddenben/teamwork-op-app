class User < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :memberships, dependent: :destroy
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
    mastery_full[0..4].each do |champ_mastery|
      mastery << { id: champ_mastery["championId"], level: champ_mastery["championLevel"] }
    end
    return mastery
  end

  def rank
    i = 0
    rank = []
    while i < rank_data.length
      queue_rank = { "#{rank_data[i]["queueType"]}" => ["#{rank_data[i]["tier"]}", "#{rank_data[i]["rank"]}"] }
      rank << queue_rank
      i += 1
    end
    if rank.any?
      return rank
    else
      return nil
    end
  end
end
