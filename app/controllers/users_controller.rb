class UsersController < ApplicationController
  def create
    user = User.new(
      email: params[:email],
      summoner_name: params[:summoner_name],
      bio: params[:bio],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: user.as_json, status: :created
    else
      render json: { errors: errors.user.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.name = params[:name] || user.name
    user.email = params[:email] || user.email
    user.summoner_id = params[:summoner_id] || user.summoner_id
    user.bio = params[:bio] || user.bio
    if user.save
      render json: user.as_json, status: :saved
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: "user account deleted" }
  end
end
