class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create, :show]

  def create
    user = User.new(
      summoner_name: params[:summoner_name],
      region: params[:region],
      email: params[:email],
      bio: params[:bio],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { id: user.id, email: user.email, summoner_name: user.summoner_name, bio: user.bio, region: user.region }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user.as_json(except: [:password_digest, :created_at, :updated_at], methods: [:champ_mastery, :rank_data, :teams, :active_teams])
  end

  def update
    # user = User.find(params[:id])
    if current_user.id == params[:id].to_i
      user = User.find(params[:id])
      user.summoner_name = params[:summoner_name] || user.summoner_name
      user.email = params[:email] || user.email
      user.region = params[:region] || user.region
      user.bio = params[:bio] || user.bio
      if user.save
        render json: { id: user.id, email: user.email, summoner_name: user.summoner_name, bio: user.bio, region: user.region }
      else
        render json: { errors: user.errors.full_messages }
      end
    else
      render json: { errors: "unautorized" }, status: 401
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "user account deleted" }
  end
end
