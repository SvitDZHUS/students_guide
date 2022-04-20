# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  # root 'welcome_pages#welcome'
  devise_scope :user do
    authenticated :user do
      root 'books#index', as: :authenticated_root
    end

    unauthenticated do
      root 'welcome_pages#welcome', as: :unauthenticated_root
    end
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'welcome', to: 'welcome_pages#welcome', as: :welcome
  get 'news', to: 'welcome_pages#about', as: :news
  get 'contacts', to: 'welcome_pages#contacts', as: :contacts

  resources :books
  resources :categories
  resources :carts, only: %i[show update]
  resources :shelves, only: %i[show update]
  resources :profiles, only: %i[show edit update]
end
