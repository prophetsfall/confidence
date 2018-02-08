class Membership < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :picks, through: :league

  validates :user_id, uniqueness: { scope: :league_id, message: "You already belong to this league" }
end
