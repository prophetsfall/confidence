class League < ApplicationRecord
  has_many :memberships
  has_many :picks
  has_many :users, through: :memberships

end
