class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user
      @memberships = current_user.memberships
      @week = Week.current_week
      @scores = []
      @memberships.each  do|membership|
       score_week = Membership.weekly_score(current_user.id, membership.league_id, @week.id)
       score_year = Membership.season_score(current_user.id, membership.league_id, @week.year)
       @scores << scores ={league:membership.league_id,week:score_week, year:score_year}
      end
    end
  end

end
