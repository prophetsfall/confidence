class Api::V1::LeaguesController < ApplicationController
  before_action :authenticate_user!
  def index
    @leagues = League.all
    render json: {leagues: @leagues}
  end
end
