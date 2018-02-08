class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    @open_leagues = []
    leagues = League.all
    leagues.each do |league|
      members = league.users
      if league.memberships.length < league.max_members && !members.find_by_id(current_user.id) && league.public_league?
        @open_leagues << league
      end
    end
  end

  def show
    @league = League.find_by_id(params[:id])
    @current_week = Week.current_week
    @games = @current_week.games
    if @league
      @members = @league.users
      if @league.public_league? || @members.find_by_id(current_user.id)
        render :show
      else
        redirect_to leagues_path
        flash[:notice] = "The league you tried to access is private"
      end
    else
      redirect_to users_path
    end
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @user = current_user
    @membership = Membership.new(league:@league, user:@user, commissioner: true)
    if @league.save && @membership.save
      flash[:notice] = "League Created Successfully!"
      redirect_to league_path(@league)
    else
      flash[:notice] = "League not created"
      render :new
    end
  end




  protected
  def league_params
    params.require(:league).permit(:league_name, :max_members, :invite_only)

  end

end
