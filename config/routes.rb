Rails.application.routes.draw do
  root "welcome#index"
  # signup
  get "signup" => "users#new", as: :users
  post "signup" => "users#create"
  # login, lougout
  get "login" => "sessions#new", as: :sessions
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
end
