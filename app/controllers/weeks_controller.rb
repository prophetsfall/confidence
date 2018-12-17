class WeeksController < ApplicationController
  before_action :authenticate_user!

  def show
    if params[:membership_id]
      @membership = Membership.find(params[:membership_id])
    end
    if params[:league_id]
      @league = League.find(params[:league_id])
    end
    @week = Week.find(params[:id])
    @weeks = Week.season_weeks
    @games = Game.where(week:@week)
    if @membership
      @picks = Pick.user_picks(@membership.user_id, @membership.league_id, @week)
      @picks.sort_by! { |pick| pick[:confidence] }.reverse!
    end
  end
end
