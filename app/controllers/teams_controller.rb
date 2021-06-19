class TeamsController < ApplicationController
    def index
     teams = Team.where(private: true)
        if params[:search_term]
            teams = teams.where("name ilike ?", "%#{params[:search_term]}%")
        end
            

     render json: teams
    end
    def create
        team = Team.new(
            name:  params[:name],
            about:  params[:about],
            user_id: params[:user_id],
            private:  params[:private]
        )
        if team.save
            render json: team
        else
            render json: {errors: team.errors.full_mesages} status: :bad_request
        end
    end
end
