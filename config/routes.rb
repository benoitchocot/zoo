Rails.application.routes.draw do
  devise_for :users

  root "articles#index"
  get '/all_articles', to: 'articles#all_articles' # Page avec tous les articles

  get 'animaux/index'
  get '/animaux', to: 'animaux#index'
  post 'animaux/reset_animaux', to: 'animaux#reset_animaux', as: :reset_animaux

  resources :articles
  resources :animaux, as: 'animals', only: [:show, :new, :create] # Assurez-vous que :show, :new et :create sont définis
  end
