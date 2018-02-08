Rails.application.routes.draw do
  get '/', to: 'users#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      # resources :leagues,only: :index do
        resources :picks
      # end
    end
  end

  resources :users
  resources :memberships

  resources :leagues do
    resources :memberships, only: [:new, :create]
    resources :picks, only: [:index]

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get'*path', to: 'users#index'
end
