class Team < ApplicationRecord
  has_many :games
  has_many :weeks, through: :games


end
