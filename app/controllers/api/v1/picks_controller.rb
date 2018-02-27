class Api::V1::PicksController < ApplicationController
  before_action :authenticate_user!

  def index
    @week_id = Week.current_week.id
    @league_id = params[:league_id]
    @picks = Pick.user_picks(current_user.id, @league_id, @week_id)
    @games = game_details
    if @games.length > 0
      if @picks.length > 0
        render json: { games:game_details, availableScores: available_confidence_scores(@picks),picks:@picks}
      else
        render json: { games:game_details, availableScores: available_confidence_scores,picks:@picks}
      end
    else
      render json: {games: "none"}
    end

  end

  def create
    @league_id = params[:league_id]
    @week_id = Week.current_week.id
    pick_params = params[:picks]
    picks = []
    pick_params.each do |pick|
      update_pick = Pick.find_by_id(pick[:id])
      if !update_pick.nil? && pick[:game_id] == update_pick.game_id
        update_pick.update(winning_team:pick[:winning_team], confidence:pick[:confidence])
      else
        picks <<  Pick.new(
          user_id:current_user.id,
          league_id:@league_id ,
          game_id:pick[:game_id],
          week_id:@week_id ,
          winning_team:pick[:winning_team],
          confidence:pick[:confidence]
        )
      end
    end
    if picks.length > 0
      if picks.map(&:save)
        render json: {picks: pick_details}
      else
        render json: {
          picks: pick_details,
          errors: new_pick.errors.full_messages },
          status: :unprocessable_entity
      end
    else
        render json: {picks: pick_details}
    end
  end


    def game_details
      all_games =  Week.current_week.games
      games = []
      all_games.map do |game|
        if game.gametime > Time.now
        games << game_hash(game)
      end
      end
      games
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
        winner_id: nil,
        gametime: game.gametime

      }
    end

    def available_confidence_scores(picks = nil)
      counter = game_details.length
      score = 16
      available_scores =[]
      counter.times do
        available_scores << score
        score -= 1
      end
      if !picks.nil?
        available_scores = [0]
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
        id:pick[:id],
        game_id:pick[:game_id],
        winning_team:pick[:winning_team],
        confidence: pick[:confidence]
      }
    end

  end
