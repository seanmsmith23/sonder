Rails.application.routes.draw do
  root "memorials#index"

  resources :sessions, only: [:new, :create]
  resources :registration, only: [:new, :create]

  resources :memorials do
    get "find", on: :collection
    resources :memberships, only: [:new, :create]
    resources :stories, only: [:create, :destroy, :edit, :update]
    resources :posts, only: [:create, :destroy, :edit, :update]
    resources :images, only: [:create, :destroy, :edit, :update, :new]
    resources :crop, only: [:new, :update]
    resources :user_permissions, only: [:update]
  end

  get "/memorials/new/add_image" => "images#add", as: :add_image

  resources :likes, only: [:create]
  resource :likes, only: [:destroy]

  get "/signout" => "sessions#destroy"
end
