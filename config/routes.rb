Rails.application.routes.draw do
  get '/', to: 'users#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :leagues, only: [] do
        resources :picks, only: [:index, :create]
      end
    end
  end

  resources :users
  resources :memberships do
    resources :weeks, only:[:show]
  end

  resources :weeks, only: [:show] do
    resources :leagues, only: [:show]
  end

  resources :leagues do
    resources :games, only: [:index, :edit, :update]
    resources :memberships, only: [:index, :new, :create, :show] do
      resources :picks, only: [:show]
    end
    resources :picks
  end

  get'*path', to: 'users#index'
end
