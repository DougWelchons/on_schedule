Rails.application.routes.draw do

  root "welcome#index"

  resources :companies, only: [:show] do
    resources :users, only: [:new, :create, :show]
  end

  get "/login", to: "users#login_form"
  post "/login", to: "users#login"
end
