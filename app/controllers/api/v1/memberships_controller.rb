class Api::V1::MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @week = Week.current_week
    @league_id = params[:league_id]
    @all_picks = Pick.league_picks
    render json:{games:"none"}
  end
end
