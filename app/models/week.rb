class Week < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :teams, through: :games

  def self.current_week
    today = Date.today
    Week.where('start_date <= ? AND end_date >= ?',today,today ).first
  end


end
