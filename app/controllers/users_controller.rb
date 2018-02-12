class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user
      @memberships = current_user.memberships

      @scores = @memberships.each  do|membership|
       score_week = Membership.weekly_score(current_user.id, membership.league_id, Week.current_week)
       score_year = Membership.season_score(current_user.id, membership.league_id)
      end
    end
  end

end
