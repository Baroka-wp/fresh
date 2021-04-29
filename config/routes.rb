Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'sessions#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :homes, only: [:index]
  resources :relationships, only: [:create, :destroy]
end
