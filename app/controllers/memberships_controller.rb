class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def new
    @league = League.find(params[:league_id])
    @membership = Membership.new
  end

  def create
    @league = League.find(params[:league_id])
    @membership = Membership.new(user:current_user, league: @league)
    binding.pry
    if @membership.save
      redirect_to league_path(@league)
      flash[:notice] = "You've successfully joined #{@league.league_name}"
    else
      redirect_to leagues_path
      flash[:notice] = "League join failed"
    end

  end



end
