Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  get 'animaux/index'
  get '/animaux', to: 'animaux#index'

  resources :articles

  namespace :api do
    resources :animaux
  end
end
