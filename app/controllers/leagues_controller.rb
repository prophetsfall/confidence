class LeaguesController < ApplicationController
  before_action :authenticate_user!
  def index
    @open_leagues = []
    leagues = League.all
    leagues.each do |league|
      if league.memberships.length < league.max_members
        @open_leagues << league
      end
    end
  end

  def show
    @league = League.find(params[:id])
    @members = @league.users
    if !@members.find(current_user.id)
      @new_member = current_user
    end
  end

end
