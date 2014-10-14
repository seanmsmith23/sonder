Rails.application.routes.draw do
  root "memorials#index"

  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]

  resources :memorials do
    get "find", on: :collection
    resources :memberships, only: [:new, :create]
    resources :stories, only: [:create, :destroy]
    resources :posts, only: [:create, :destroy]
    resources :images, only: [:create, :destroy]
  end

  resources :likes, only: [:create]
  resource :likes, only: [:destroy]

  get "/signout" => "sessions#destroy"

end
