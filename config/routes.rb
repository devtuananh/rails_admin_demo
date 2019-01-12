Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/static_pages/:page", to: "static_pages#show"
  devise_for :users

  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    get 'log_in', to: 'devise/sessions#new'
    post 'log_in', to: 'devise/sessions#create'
    delete 'log_out', to: 'devise/sessions#destroy'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
  resources :posts
end
