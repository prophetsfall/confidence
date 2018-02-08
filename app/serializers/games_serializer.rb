class GamesSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :home_team

end
