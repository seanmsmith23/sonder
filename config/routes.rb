Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]
  resources :memorials

  root "memorials#index"

  get "memorials/find", as: :find_memorial

end
