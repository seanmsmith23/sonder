Rails.application.routes.draw do
  root "memorials#index"

  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]

  resources :memorials do
    get "find", on: :collection
    resources :memberships, only: [:new, :create]
    resources :stories, only: [:create]
    resources :posts, only: [:create]
    resources :images, only: [:create]
  end

  resources :likes, only: [:create]
  resource :likes, only: [:destroy]

  get "/signout" => "sessions#destroy"

end
