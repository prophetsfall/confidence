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
    @teams = Team.all
    @weeks = Week.where(year:Week.current_week.year)
  end

  def update
    @league = League.find(params[:league_id])
    @away_team = League.find(params[:away_team_id])
    @home_team = League.find(params[:home_team_id])
    @week = League.find(params[:week_id])
    game = Game.find(params[:id])
    winner = params[:game][:winner_id]
    game.update(winner_id:winner)
    @league.memberships.each do |member|
      Membership.calculate_weekly_score(member,@league,game.week)
      Membership.calculate_season_score(member, @league, game.week.year)
    end
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
