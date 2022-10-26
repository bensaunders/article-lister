Rails.application.routes.draw do
  get 'articles/index'
  get 'articles', to: 'articles#index'
  get 'articles/:id/like', to: 'articles#like'

  # Defines the root path route ("/")
  root "articles#index"
end
