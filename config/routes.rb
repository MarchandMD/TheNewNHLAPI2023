Rails.application.routes.draw do
  root "welcome#index"

  resources :endpoints
  resources :teams, only: %i[index show]
  resources :players, only: %i[index show]
end
