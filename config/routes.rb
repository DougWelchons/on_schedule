Rails.application.routes.draw do

  root "welcome#index"

  resources :companies, only: [:show] do
    resources :users, only: [:new, :create]
  end

  get "/login", to: "users#login_form"
end
