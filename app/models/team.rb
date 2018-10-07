class Team < ApplicationRecord
  has_many :games
  has_many :weeks, through: :games


  def self.home(game)
      Team.find_by_id(game.home_team_id)
  end
  def self.away(game)
      Team.find_by_id(game.away_team_id)
  end
end
