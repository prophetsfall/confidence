class PicksController < ApplicationController
  def index
    @league = League.find_by_id(params[:league_id])
    @current_week = Week.current_week
    @games = @current_week.games
    @picks = Pick.user_picks(current_user.id, @league.id, @current_week.id)
    if Membership.where('league_id =? and user_id =?',@league.id ,current_user.id).length == 0
      redirect_to league_path(@league)
      flash[:notice]="You are not a member of this league"
    end
  end

  def new
    @league = League.find_by_id(params[:league_id])
    @week = Week.current_week
    @games = @week.games
    @membership = Membership.find_by_id(params[:membership_id])
    @teams = Team.all
    @pick = Pick.new(
      league:@league,
      week:@week,
      user:@membership.user
    )
  end

  def create
    @game = Game.find(params[:pick][:game_id])
    @pick = Pick.new()
    @pick.week = @game.week
    @pick.league_id = params[:league_id]
    @pick.game_id  = params[:pick][:game_id]
    @pick.confidence = params[:pick][:confidence]
    @pick.user_id = Membership.find(params[:membership_id]).user_id
    @pick.winning_team = params[:pick][:winning_team]
    @user = current_user
    @membership = Membership.find(params[:membership_id])
    if @pick.save
      league = League.find(@pick.league_id)
      redirect_to league_path(league)
    else
      render :new
    end
  end

  def edit;end

   protected
   def pick_params
     params.require(:league).permit(@league, @current_week, @games, @picks)
   end

end
