class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :league
  belongs_to :game
  belongs_to :week

  def self.user_picks(user,league,week)
   Pick.where('user_id = ? AND league_id =? and week_id = ?', user, league,week)
  end
end
