class League < ApplicationRecord
  has_many :memberships
  has_many :picks
  has_many :users, through: :memberships

  validates :league_name, presence: true, uniqueness: true

end
