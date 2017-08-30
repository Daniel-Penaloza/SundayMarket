Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :admin_users
    resources :products
    resources :categories
    root to: "users#index"
  end

  resources :users
  resources :products
  resources :categories

  # Naming routes for sellers
  get 'sellers', to: 'users#index', as: :sellers
  get 'seller/:id', to:  'users#show', as: :seller
  get 'seller/:id/edit', to: 'users#edit', as: :edit_seller
  get 'seller/:id/products', to: 'users#products', as: :seller_products


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}  
  root to: "home#index"
  
end