class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_week
    today = Date.today
    current_week = Week.where('start_date <= ? AND end_date >= ?',today,today ).first
    current_week
  end


  def current_week_games
    week = current_week.id
    games = Game.where('week_id = ?', week)
    games
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :first_name, :last_name,:profile_photo])
  end

end
