class GamesController < ApplicationController
  before_action :validate_commissioner

  def index
    @week = Week.current_week
    @games = Game.where(week:@week)
    @league = League.find(params[:league_id])
  end

  def edit

  end

  def update

  end

  def validate_commissioner
    user = current_user
    league = params[:league_id].to_i
    commish = Membership.where(league_id:league, commissioner:true).first
    if !user.id == commish.user_id
      redirect_to league_path(league)
    end
  end


end
