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
    members = league.memberships
    scores = members.map do |member|
      {
        member_id: member.id,
        username: member.user.username,
        score_week: nil,
        score_season: member.season_score
      }
    end
    scores.each do | score|
      score[:score_week] = Membership.show_weekly_score(Membership.find(score[:member_id]), league, week)
    end
    scores = scores.sort_by { |k| k[:score_season]}.reverse
  end

  def self.contains_member?(league, member = nil)
    members = league.memberships
    included = false
    if members.where(user:member).size >0
      included = true
    end
    return included
  end

  def self.valid_name?(str)
    return true if (/^[a-z\d\-_\s]+$/i.match(str))
    return false
  end

end
