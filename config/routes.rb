Rails.application.routes.draw do
  get '/', to: 'users#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :memberships
      resources :leagues, only: [] do
        resources :picks, only: [:index, :create]
        resources :memberships, only: [:index]
      end
    end
  end

  resources :users


  resources :leagues do
    resources :games, only: [:index, :edit, :update]
    resources :memberships, only: [ :new, :create, :show] do
      resources :picks, only: [:show]
    end
    resources :picks, only: [:index, :edit,:update]

  end

  get'*path', to: 'users#index'
end
