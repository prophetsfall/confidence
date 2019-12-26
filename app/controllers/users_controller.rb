class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user
      @memberships = current_user.memberships
      @week = Week.current_week
      @scores = []
      @memberships.each  do|membership|
        weekly_score = Membership.calculate_weekly_score(membership, membership.league, Week.current_week)
        @scores << scores ={league:membership.league_id,week:weekly_score, year:membership.season_score}
      end
    end
  end

end
