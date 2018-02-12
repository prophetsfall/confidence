class Membership < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :picks, through: :league

  validates :user_id, uniqueness: { scope: :league_id, message: "You already belong to this league" }

  def self.season_score(user, league)
    membership = Membership.where('user_id = ? AND league_id = ?', user,league)
    membership[0].score
  end


  def self.weekly_score(user, league, week)
    score = 0
    picks = Pick.user_picks(user, league, week)
    picks.each do |pick|
      game = Game.find(pick.game_id)
      if game.winner_id
        if pick.winning_team == game.winner_id
          score += pick.confidence
        else
          score -= pick.confidence
        end
      end
    end
    membership = Membership.where('user_id = ? AND league_id = ?', user, league)
    membership.update(score:score)
    score
  end
end
