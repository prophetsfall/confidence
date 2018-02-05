class Week < ApplicationRecord
  has_many :games
  has_many :picks

end
