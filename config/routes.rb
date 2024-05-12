Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :predictions
  end

  root "teams#index"

  resources :endpoints
  resources :teams, only: %i[index show] do
    resources :players, only: %i[index show]
  end
  resources :games, only: %i[index show]
  resources :predictions
  resources :players, only: %i[index show]
  get "/about", to: "about#about", as: :about
end
