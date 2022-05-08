# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  # root 'welcome_pages#welcome'
  devise_scope :user do
    authenticated :user, ->(u) { u.role == 'admin' } do
      root to: "admin/books#index", as: :admin_root
    end

    authenticated :user, ->(u) { u.role == 'member' } do
      root to: "books#index", as: :member_root
    end

    unauthenticated do
      root 'welcome_pages#welcome', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'welcome', to: 'welcome_pages#welcome', as: :welcome

  resources :orders, only: :new
  post :create_order, to: 'orders#create_order'
  post :capture_order, to: 'orders#capture_order'

  resources :line_items, only: %i[destroy]
  post :add_item_to_cart, to: 'line_items#add_item_to_cart'

  resources :books, only: %i[index show]
  resources :carts, only: %i[show]
  resources :shelves, only: %i[show]
  resources :profiles, only: %i[show edit update]

  namespace :admin do
    resources :users, only: %i[index show]
    resources :categories
    resources :books
  end
end
