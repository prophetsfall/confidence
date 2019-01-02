class Membership < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :picks, through: :league

  validates :user_id, uniqueness: { scope: :league_id, message: "You already belong to this league" }

  def self.calculate_season_score(member,league,year)
    weeks = Week.where('year = ?', year)
    season_score = member.season_score
    season_score = 0
    weeks.each do |week|
      week_score = Membership.calculate_weekly_score(member, member.league,week)
      season_score += week_score
    end
    member.update(season_score:season_score)
    season_score
  end

  def self.calculate_weekly_score(user, league, week)
    score = 0
    picks = Pick.user_picks(user.user_id, league.id, week.id)
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
    user.update(weekly_score:score)
    score
  end
end
