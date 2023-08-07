Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "budget#index"

  resources :categories, only: [:index, :new]

  resources :categories, only: [] do
    resources :transaction_budgets, only: [:index, :new, :create]
  end

end
