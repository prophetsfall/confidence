class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if current_user
      @leagues = current_user.leagues
    end
  end
  
end
