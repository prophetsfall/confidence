class Api::V1::LeaguesController < ApplicationController
  def show
    league = League.find(params[:id])
    scores = League.league_scores(league)
    binding.pry
    picks = Pick.league_picks
    render json:{league:league, scores:scores}
  end
end
