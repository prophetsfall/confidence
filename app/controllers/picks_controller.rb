class PicksController < ApplicationController
  def index
    @league = League.find_by_id(params[:league_id])
    @current_week = Week.current_week
    @games = @current_week.games
    @picks = Pick.user_picks(current_user.id, @league.id, @current_week.id)

  end

  def edit;end


   protected
   def pick_params
     params.require(:league).permit(@league, @current_week, @games, @picks)

   end

end
