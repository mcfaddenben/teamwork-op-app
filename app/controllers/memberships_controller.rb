class MembershipsController < ApplicationController
  def create
    membership = Membership.new(
      user_id: params[:user_id],
      team_id: params[:team_id],
      primary_role: params[:primary_role],
      secondary_role: params[:secondary_role],
      fill: params[:fill],
      assigned_role: params[:assigned_role],
    )
    if membership.save
      render json: membership.as_json, status: :created
    else
      render json: { errors: errors.membership.full_messages }, status: :bad_request
    end
  end

  def update
    memberhip = Membership.find(params[:id])
    membership.user_id = params[:user_id] || membership.user_id
    membership.team_id = params[:team_id] || membership.team_id
    membership.primary_role = params[:primary_role] || membership.primary_role
    membership.secondary_role = params[:secondary_role] || membership.secondary_role
    membership.fill = params[:fill] || membership.fill
    membership.assigned_role = params[:assigned_role] || membership.assigned_role
    if membership.save
      render json: membership.as_json, status: :saved
    else
      render json: { errors: membership.errors.full_messages }
    end
  end

  def destroy
    memberhip = Membership.find(params[:id])
    membership.destroy
    render json: { message: "Membership Deleted" }
  end
end
