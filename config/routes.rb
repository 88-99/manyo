Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  get 'sessions/new'
  root 'tasks#index'
  resources :tasks
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]
end
