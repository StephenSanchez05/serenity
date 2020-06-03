Rails.application.routes.draw do
  resources :characters
  resources :spells
  resources :heros

  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :users  
  
  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#fb'
  post '/session', to: 'sessions#fb', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
end
