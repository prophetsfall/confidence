class Game < ApplicationRecord
  has_many :picks
  belongs_to :week
end
