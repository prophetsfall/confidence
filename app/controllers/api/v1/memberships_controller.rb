class Api::V1::MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    memberships = current_user.memberships
    leagues = user.leagues
    render json: {memberships:memberships, leagues:leagues}
  end

  def show
    membership = Membership.find(params[:id])
    league = membership.league
    user = membership.user
    week = Week.find(47)
    picks = Pick.where(league:league, user:user, week:week)
    render json:{membershp:membership, picks:picks, user:user, league:league}
  end
end
