Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  resources :endpoints
  resources :teams, only: %i[index show] do
    resources :players, only: %i[index show]
  end
  resources :schedules
  resources :players, only: %i[index show]
  get "/about", to: "about#about", as: :about
end
