class Week < ApplicationRecord
  has_many :games
  has_many :picks
  has_many :teams, through: :games


end
