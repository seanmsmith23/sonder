Rails.application.routes.draw do
  root "memorials#index"

  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]

  resources :memorials do
    get "find", on: :collection
    resources :memberships, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :likes, only: [:create, :destroy]

  get "/signout" => "sessions#destroy"

end
