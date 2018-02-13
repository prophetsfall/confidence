class Api::V1::PicksController < ApplicationController
  before_action :authenticate_user!

  def index
    @week_id = Week.current_week.id
    @league_id = params[:league_id]
    picks = Pick.user_picks(current_user.id, @league_id, @week_id)
    render json: { games:game_details, availableScores: available_confidence_scores,picks:picks}
  end

  def create
    @league_id = params[:league_id]
    @week_id = Week.current_week.id
    pick_params = params[:picks]
    picks = []
    pick_params.each do |pick|
      picks <<  Pick.new(
        user_id:current_user.id,
        league_id:@league_id ,
        game_id:pick[:gameId],
        week_id:@week_id ,
        winning_team:pick[:winningTeamId],
        confidence:pick[:confidenceScore]
      )
    end
    if picks.map(&:save)
      render json: {picks: pick_details}
    else
      render json: {
        picks: pick_details,
        errors: new_review.errors.full_messages },
        status: :unprocessable_entity
    end

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

  def available_confidence_scores
    counter = game_details.length
    score = 16
    available_scores =[]
      counter.times do
        available_scores << score
        score -= 1
      end
    available_scores
  end


  def pick_details
    users_picks = Pick.user_picks(current_user.id, @league_id, @week_id)
    users_picks.map do |pick|
      pick_hash(pick)
    end
  end

  def pick_hash(pick)
    {
      gameId:pick[:game_id],
      winningTeamId:pick[:winning_team],
      confidenceScore: pick[:confidence],
      weekId:pick[:week_id],
      user_id: pick[:user_id]
    }
  end

end
