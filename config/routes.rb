Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]
  resources :memorials

  root "memorials#index"

  get "memorial/find", to: "memorials#find", as: :find_memorial
  post "memorial/join", to: "memorials#join", as: :join_memorial

end
