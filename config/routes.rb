Rails.application.routes.draw do
  root "endpoints#index"

  resources :endpoints
end
