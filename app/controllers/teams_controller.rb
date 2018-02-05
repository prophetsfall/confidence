class Team <  Application_Controller

  def index
    @teams = Team.all
  end

end
