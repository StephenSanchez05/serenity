Rails.application.routes.draw do
  resources :characters
  resources :spells
  resources :heros
  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session', to: 'sessions#destroy', as: 'logout'
end
