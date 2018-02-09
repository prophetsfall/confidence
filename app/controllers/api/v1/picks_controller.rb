class Api::V1::PicksController < ApplicationController

  def index
    render json: { games:game_details}
  end

  def create
    Pick.delete(user_picks)
    @league_id = params[:leagueID]
    @week_id = Week.current_week.id
    picks = params[:picks]
    picks.each do |pick|
      Pick.create!(user_id:current_user.id, league_id:@league_id ,game_id:pick[:gameId], week_id:@week_id , winning_team:pick[:winningTeamId], confidence:pick[:confidenceScore])
    end
    render json: {picks: pick_details}
  end

  def game_details
    all_games =  Week.current_week.games
    all_games.map do |game|
      game_hash(game)
    end
  end

  def game_hash(game)
    {
      id: game.id,
      home_team_location: game.home_team.location,
      home_team_name: game.home_team.team_name,
      home_team_id: game.home_team.id,
      away_team_location: game.away_team.location,
      away_team_name: game.away_team.team_name,
      away_team_id: game.away_team.id,
      winner_id: nil

    }
  end

  def user_picks
   Pick.where('user_id = ? AND league_id =? and week_id = ?', current_user.id, @league_id, @week_id)
  end

  def pick_details
    user_picks.map do |pick|
      pick_hash(pick)
    end
  end

  def pick_hash(pick)
    {
      gameId:pick.game_id,
      winningTeamId:pick.winning_team,
      confidenceScore: pick.confidence
    }
  end

end
