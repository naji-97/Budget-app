# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  # Defines the root path route ("/")
  root 'budget#index'

  resources :categories, only: %i[index show new create] do
    resources :transaction_budgets, only: %i[index new create]
  end
end
