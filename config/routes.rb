Rails.application.routes.draw do
  root to: 'photos#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/new'

  resources :users do
    resources :photos
  end
  resources :sessions
end
