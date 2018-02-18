class Membership < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :picks, through: :league

  validates :user_id, uniqueness: { scope: :league_id, message: "You already belong to this league" }

  def self.season_score(user, league, year)
    weeks = Week.where('year = ?', year)
    membership = Membership.where('user_id = ? AND league_id = ?', user,league).first
    season_score = membership.season_score
    season_score = 0

    weeks.each do |week|
      week_score = Membership.weekly_score(membership.user_id, membership.league_id,week.id)

      season_score += week_score
    end
    season_score
  end


  def self.weekly_score(user, league, week)
    score = 0
    picks = Pick.user_picks(user, league, week)
    picks.each do |pick|
      game = Game.find(pick[:game_id])
      if game.winner_id
        if pick[:winning_team] == game.winner_id
          score += pick[:confidence]
        else
          score -= pick[:confidence]
        end
      end
    end
    membership = Membership.where('user_id = ? AND league_id = ?', user, league)
    membership.update(weekly_score:score)
    score
  end
end
