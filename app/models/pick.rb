class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :league
  belongs_to :game
  belongs_to :week

  def self.user_picks(user,league,week)
    picks = Pick.where('user_id = ? AND league_id =? and week_id = ?', user, league,week)
    picks = picks.map do |pick|
      {
        id: pick.id,
        winning_team: pick.winning_team,
        confidence: pick.confidence,
        game_id: pick.game_id
      }
    end

   picks.sort_by! { |pick| pick[:game_id] }

  end

  def self.league_picks(week,league)
    picks = Pick.where(week:week, league:league)
    binding.pry
  end
end
