Rails.application.routes.draw do

  get 'animaux/index'
  get '/animaux', to: 'animaux#index'
  root "articles#index"

  resources :articles do
  resources :comments
end

  namespace :api do
    resources :animaux
end
end
