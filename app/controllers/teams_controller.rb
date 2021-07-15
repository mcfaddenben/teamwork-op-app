class TeamsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    teams = Team.where(private: false)
    # if params[:search_term]
    #   teams = teams.where("name ilike ?", "%#{params[:search_term]}%")
    # end
    render json: teams #, include: "memberships.user"
  end

  def create
    team = Team.new(
      name: params[:name],
      about: params[:about],
      user_id: current_user.id,
      private: params[:private], default
    )
    if team.save
      render json: team
    else
      render json: { errors: team.errors.full_messages }, status: :bad_request
    end
  end

  def show
    team = Team.find(params[:id])
    render json: team, include: "memberships.user"
  end

  def update
    team = Team.find(params[:id])
    if current_user.id == team.user_id
      team.name = params[:name] || team.name
      team.private = params[:private] || team.private
      team.about = params[:about] || team.about
      if team.save
        render json: team
      else
        render json: { errors: team.errors.full_messages }
      end
    else
      render json: { errors: "unauthorized" }, status: 401
    end
  end

  def destroy
    team = Team.find(params[:id])
    if current_user.id == team.user_id
      team.destroy
      render json: { message: "team deleted" }
    end
  end
end
