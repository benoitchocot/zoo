Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  get 'animaux/index'
  get '/animaux', to: 'animaux#index'
  post 'api/animaux/reset_animaux', to: 'api/animaux#reset_animaux', as: :reset_animaux

  resources :articles

  namespace :api do
    resources :animaux, only: [:index, :new, :create, :show, :update, :destroy]

end
end
