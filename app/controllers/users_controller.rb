class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user
      @memberships = current_user.memberships
      @week = Week.current_week
      @scores = []
      @memberships.each  do|membership|
       @scores << scores ={league:membership.league_id,week:membership.weekly_score, year:membership.season_score}
      end
    end
  end

end
