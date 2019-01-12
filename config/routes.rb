Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/static_pages/:page", to: "static_pages#show"
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
  resources :posts
end
