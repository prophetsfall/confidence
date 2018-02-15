class Game < ApplicationRecord
  has_many :picks, dependent: :destroy
  belongs_to :home_team, class_name: 'Team', foreign_key: :home_team_id
  belongs_to :away_team, class_name:'Team', foreign_key: :away_team_id
  belongs_to :winner, class_name:'Team', foreign_key: :winner_id, optional:true

  has_many :teams

  belongs_to :week


end
