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

  def edit;end

  def new
    @league = League.find_by_id(params[:league_id])
    @current_week = Week.current_week
    @games = @current_week.games
    @memberships = @league.memberships
    @current_member = Membership.where(user:current_user, league:@league)[0]
  end

  def create
    
  end


   protected
   def pick_params
     params.require(:league).permit(@league, @current_week, @games, @picks)
   end

end
