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

end
