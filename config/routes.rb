Rails.application.routes.draw do

  get '/home',to:'users#home'
  get '/like',to:'users#like'
  get '/break',to:'users#break'
  root 'sessions#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :homes, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :breakships, only: [:create, :destroy]
end
