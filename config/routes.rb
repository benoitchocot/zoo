Rails.application.routes.draw do
  devise_for :users

  root "articles#index"
  get '/all_articles', to: 'articles#all_articles' # Page avec tous les articles

  get 'animals/index'
  get '/animals', to: 'animals#index'
  post 'animals/reset_animals', to: 'animals#reset_animals', as: :reset_animals

  resources :articles
  resources :animals
  resources :visits
  end
