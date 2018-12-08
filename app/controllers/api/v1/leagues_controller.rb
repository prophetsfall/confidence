class Api::V1::LeaguesController < ApplicationController
  before_action :authenticate_user!
  def index
    @leagues = []
    leagues = League.all
    leagues.each do |league|
      if league.public_league? || League.contains_member?(league,current_user)
        @leagues << league
      end
    end
    render json: {leagues: @leagues}
  end

  def show
    @league = params[:id]
  end
end
