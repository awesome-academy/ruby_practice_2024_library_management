Rails.application.routes.draw do
  get "borrow_requests/new"
  get "borrow_requests/create"
  get "comments/create"
  get "authors/index"
  get "authors/show"
  get "categories/index"
  get "categories/show"
  get "books/show"
  get "users/show"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "home/index"
  get "signup", to: "registrations#new", as: "signup"
  post "registrations", to: "registrations#create"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  delete "logout", to: "sessions#destroy"

  root "home#index"

  resources :users, only: %i(show)
  resources :books, only: %i(show)
  resources :categories, only: %i(index show)
  resources :authors, only: %i(index show)
  resources :books do
    resources :comments, only: %i(create)
    resources :borrow_requests, only: %i(new create)
  end
end
