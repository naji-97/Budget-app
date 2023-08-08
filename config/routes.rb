Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  # Defines the root path route ("/")
  root "budget#index"

  resources :categories, only: [:index, :show, :new, :create] do
    resources :transaction_budgets, only: [:index, :new, :create]
  end
end
