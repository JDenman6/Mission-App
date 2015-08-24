Rails.application.routes.draw do
  get 'goals/index'

  get 'goals/show'

  get 'goals/new'

  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  root "sessions#new"
end
