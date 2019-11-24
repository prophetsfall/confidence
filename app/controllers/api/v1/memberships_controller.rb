class Api::V1::MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = current_user
    memberships = Membership.membership_serializer(current_user.memberships)
    render json: {memberships:memberships}
  end

  def show
    membership = Membership.find(params[:id])
    league = membership.league
    user = membership.user
    week = Week.current_week
    picks = Pick.where(league:league, user:user, week:week)
    render json:{membershp:membership, picks:picks, user:user, league:league}
  end
end
