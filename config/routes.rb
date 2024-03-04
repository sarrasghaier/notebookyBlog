Rails.application.routes.draw do
  devise_for :users
  root "articles#home"
  get 'articles/contact', to: 'articles#contact', as: 'articles_contact'
  get 'articles/profile', to: 'articles#profile', as: 'articles_profile'

  namespace :api do
    namespace :v1 do
      resources :articles
    end
  end
  resources :articles
  resources :articles, only: [:destroy]
  resources :articles do
  resources :comments
  end
end