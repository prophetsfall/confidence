Rails.application.routes.draw do
  get '/', to: 'users#index'
  devise_for :users

  resources :users, :leagues, :memberships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
