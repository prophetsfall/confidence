class League < ApplicationRecord

  has_many :memberships
  has_many :picks
  has_many :users, through: :memberships

  validates :league_name, presence: true, uniqueness: true
  validates :max_members, numericality: {greater_than: 1, less_than: 1000}
  validates :invite_only, numericality: {greater_than: 0, less_than: 3}

  def public_league?
    invite_only == 2
  end

  def self.league_scores(league_id)
    league = League.find(league_id)
    members = league.memberships
    scores = members.map do |member|
      {
        username: member.user.username,
        score_week: Membership.weekly_score(member.user_id,league_id, Week.current_week ),
        score_season: member.score
      }
    end
    scores = scores.sort_by { |k| k[:score_season]}.reverse
  end

end
