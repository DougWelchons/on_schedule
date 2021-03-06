Rails.application.routes.draw do

  root "welcome#index"

  resources :companies, only: [:index] do
    resources :users, only: [:new, :create, :show]
    resources :projects, only: [:new, :create, :show]
    get "/", to: "companies#show"
  end

  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
  get "/dashboard", to: "users#dashboard"
end
