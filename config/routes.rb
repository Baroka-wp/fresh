Rails.application.routes.draw do
  get '/home',to:'users#home'
  root 'sessions#new'
  resources :users
   resources :sessions, only: [:new, :create, :destroy]
end
