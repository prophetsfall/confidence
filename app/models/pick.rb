class Pick < Application_Controller
  belongs_to :user
  belongs_to :league
  belongs_to :game
  belongs_to :week

end
