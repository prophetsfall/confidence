class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :league
  belongs_to :game
  belongs_to :week

  def self.user_picks(user,league,week)
    picks = Pick.where('user_id = ? AND league_id =? and week_id = ?', user, league,week)
    picks.map do |pick|
      {
        id: pick.id,
        winning_team: pick.winning_team,
        confidence: pick.confidence,
        game_id: pick.game_id
        }
    end
  end
end
