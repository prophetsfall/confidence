class LeaguesController < ApplicationController
  before_action :authenticate_user!
  def index
    @leagues = League.find(params[:membership_id])
  end

  def show
    @league = League.find(params[:id])
  end

end
