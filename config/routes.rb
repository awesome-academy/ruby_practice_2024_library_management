Rails.application.routes.draw do
  get "home/index"
  get "signup", to: "registrations#new", as: "signup"
  post "registrations", to: "registrations#create"

  root "home#index"
end
