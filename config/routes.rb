# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  put 'locales/:locale', to: 'locales#update', as: :locale,
                         constraints: { locale: /#{I18n.available_locales.join('|')}/ }

  root 'welcome_pages#welcome'
  get 'welcome', to: 'welcome_pages#welcome', as: :welcome
  get 'news', to: 'welcome_pages#about', as: :news
  get 'contacts', to: 'welcome_pages#contacts', as: :contacts

  resources :books
end
