Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  resources :endpoints
  resources :teams, only: %i[index show]
  resources :players, only: %i[index show]
  resources :schedules
end
