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
    game = Game.find(params[:id])
    @league = League.find(params[:league_id])
    @away_team = Team.find(params[:game][:away_team_id])
    @home_team = Team.find(params[:game][:home_team_id])
    @week = Week.find(params[:game][:week_id])
    winner = params[:game][:winner_id].to_i
    if winner != @away_team.id && winner != @home_team.id
      winner = nil
    end
    game.update(
      winner_id:winner,
      away_team: @away_team,
      home_team: @home_team,
      week:@week,
      gametime:params[:game][:gametime]
    )
    @league.memberships.each do |member|
      Membership.calculate_weekly_score(member,@league,@week)
      Membership.calculate_season_score(member, @league,@week.year)
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
