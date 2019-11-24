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
      picks
    end

  def self.pick_details
    users_picks = Pick.user_picks(user_id, league_id, week_id)
    users_picks.map do |pick|
      {
        id:pick[:id],
        game_id:pick[:game_id],
        winning_team:pick[:winning_team],
        confidence: pick[:confidence]
      }
    end
  end
end
