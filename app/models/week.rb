class Week < ApplicationRecord
  has_many :games
  has_many :picks
  has_many :teams, through: :games

  def self.current_week
    today = Date.today
    Week.where('start_date <= ? AND end_date >= ?',today,today ).first
  end


end
