class MembershipsController < ApplicationController
  before_action :authenticate_user

  def create
    membership = Membership.new(
      user_id: current_user.id,
      team_id: params[:team_id],
      primary_role: params[:primary_role],
      secondary_role: params[:secondary_role],
      fill: params[:fill],
      assigned_role: params[:assigned_role],
    )
    if membership.save
      render json: membership
    else
      render json: { errors: errors.membership.full_messages }, status: :bad_request
    end
  end

  def update
    membership = Membership.find(params[:id])
    if current_user.id == membership.user_id
      membership.primary_role = params[:primary_role] || membership.primary_role
      membership.secondary_role = params[:secondary_role] || membership.secondary_role
      membership.fill = params[:fill] || membership.fill
      membership.assigned_role = params[:assigned_role] || membership.assigned_role
      if membership.save
        render json: membership
      else
        render json: { errors: membership.errors.full_messages }
      end
    else
      render json: { errors: "unauthorized" }, status: 401
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    if current_user.id == membership.user_id
      membership.destroy
      render json: { message: "Membership Deleted" }
    end
  end
end
