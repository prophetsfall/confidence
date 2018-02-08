class Api::V1::PicksController < ApplicationController

  def index
    render json: { games:game_details}
  end

  # def serialized_games
  #   all_games =  Week.current_week.games
  #   all_games.map do |game|
  #     GamesSerializer.new(game)
  #   end
  # end

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

end
