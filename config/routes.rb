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
  resources :memberships

  resources :leagues do
    resources :memberships, only: [:new, :create]
    resources :picks, only: [:index, :edit,:update]

  end

  get'*path', to: 'users#index'
end
