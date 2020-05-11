Rails.application.routes.draw do
  resources :characters
  resources :spells
  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
end
