Rails.application.routes.draw do
  root "articles#index"

  resources :articles do
  resources :comments
end

  namespace :api do
    get 'animaux/:id', to: 'articles#show'
    get 'animaux', to: 'articles#animaux'
    get 'bassins', to: 'articles#bassins'
  end

end
