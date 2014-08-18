Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]

  root "registration#new"

end
