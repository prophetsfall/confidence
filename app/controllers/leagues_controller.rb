class LeaguesController < ApplicationController
  before_action :authenticate_user!
  def index
    @open_leagues = []
    leagues = League.all
    leagues.each do |league|
      members = league.users
      if league.memberships.length < league.max_members && !members.find_by_id(current_user.id)
        @open_leagues << league
      end
    end
  end

  def show
    @league = League.find(params[:id])
    @members = @league.users
    if !@members.find_by_id(current_user.id)
      @new_member = current_user
    end
  else

  end

protected
def league_params
  params.require(:league).permit(:league_name, :id)

end
end
