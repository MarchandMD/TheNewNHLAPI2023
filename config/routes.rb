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
  resources :schedules
  resources :players, only: %i[index show]
  get "/about", to: "about#about", as: :about
  get "/organizational_display_of_teams", to: "teams#organizational_display_of_teams"

  get "/predictions", to: "prediction_home#index"
end
