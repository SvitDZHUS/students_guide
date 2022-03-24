# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome', to: 'welcome_pages#welcome', as: :welcome
  get 'about', to: 'welcome_pages#about', as: :about
  get 'contacts', to: 'welcome_pages#contacts', as: :contacts
end
