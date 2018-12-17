class League < ApplicationRecord

  has_many :memberships, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :users, through: :memberships

  validates :league_name, presence: true, uniqueness: true
  validates :max_members, numericality: {greater_than: 1, less_than: 1000}
  validates :invite_only, numericality: {greater_than: 0, less_than: 3}

  def public_league?
    invite_only == 2
  end

  def self.league_scores(league, week)
    league = league
    week = week
    members = league.memberships
    scores = members.map do |member|
      {
        member_id: member.id,
        username: member.user.username,
        score_week: Membership.weekly_score(member.user_id,league.id, week ),
        score_season: Membership.season_score(member.user_id, league.id, Week.current_week.year)
      }
    end
    scores = scores.sort_by { |k| k[:score_season]}.reverse
  end

  def self.valid_name?(str)
    return true if (/^[a-z\d\-_\s]+$/i.match(str))
    return false
  end

end
