class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @league = League.find(params[:league_id])
    @membership = Membership.new
  end

  def index
    @user = current_user

    @league = League.find(params[:league_id])
    @memberships = Membership.where(league_id:params[:league_id])
    @picks = League.league_picks(@league)
  end

  def show
    @user = current_user
    @membership = Membership.find_by_id(params[:id])
    @picks = Pick.user_picks(@membership.user_id, @membership.league_id, Week.current_week)
    @picks.sort_by! { |pick| pick[:confidence] }.reverse!
    @week = Week.current_week
    @weeks = Week.season_weeks
  end

  def create
    @league = League.find(params[:league_id])
    @membership = Membership.new(user:current_user, league: @league)
    if @membership.save
      redirect_to league_path(@league)
      flash[:notice] = "You've successfully joined #{@league.league_name}"
    else
      redirect_to leagues_path
      flash[:notice] = "League join failed"
    end
  end

end
