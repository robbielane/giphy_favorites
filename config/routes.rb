Rails.application.routes.draw do
  resources :users
  namespace :admin do
    resources :gifs
    resources :categories
  end

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :categories, only: [:index, :show]
  resources :favorites
end
