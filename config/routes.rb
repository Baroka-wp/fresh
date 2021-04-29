Rails.application.routes.draw do
  root 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :homes, only: [:index]
end
