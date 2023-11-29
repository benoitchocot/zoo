Rails.application.routes.draw do
  devise_for :users

  root "articles#index"
  get '/all_articles', to: 'articles#all_articles' # Page avec tous les articles

  get 'animaux/index'
  get '/animaux', to: 'animaux#index'

  resources :articles

    resources :animaux, only: [:index, :show, :new, :create]
      post 'animaux/reset_animaux', to: 'animaux#reset_animaux', as: :reset_animaux
  end
