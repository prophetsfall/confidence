class GamesController < ApplicationController
  before_action :validate_commissioner

  def index
    @week = Week.current_week
    @games = Game.where(week:@week)
    @league = League.find(params[:league_id])
  end

  def edit
    @league = League.find(params[:league_id])
    @game = Game.find(params[:id])
    @teams = Game.teams(@game)
  end

  def update
    game = Game.find(params[:id])
    winner = params[:game][:winner_id]
    game.update(winner_id:winner)
    redirect_to league_games_path
  end

  def validate_commissioner
    user = current_user
    league = params[:league_id].to_i
    commish = Membership.where(league_id:league, commissioner:true).first
    if !user.id == commish.user_id
      redirect_to league_path(league)
    end
  end


end
