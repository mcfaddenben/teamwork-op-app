class TeamsController < ApplicationController
  def index
    teams = Team.where(private: false)
    if params[:search_term]
      teams = teams.where("name ilike ?", "%#{params[:search_term]}%")
    end

    render json: teams
  end

  def create
    team = Team.new(
      name: params[:name],
      about: params[:about],
      user_id: params[:user_id],
      private: params[:private],
    )
    if team.save
      render json: team
    else
      render json: { errors: team.errors.full_messages }, status: :bad_request
    end
  end

  def show
    team = Team.find(params[:id])
    render json: team
  end

  def update
    team = Team.find(params[:id])
    team.name = params[:name] || team.name
    team.private = params[:private] || team.private
    team.about = params[:about] || team.about
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    render json: { message: "team deleted" }
  end
end
