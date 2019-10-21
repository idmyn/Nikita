Rails.application.routes.draw do
  resources :ideas
  resources :users, except: [:new, :create]
  # post "ideas/:id/pin", to: "ideas#new_pin", as: "new_pin"
  get "/log-in", to: "sessions#new", as: "new_session"
  post "/log-in", to: "sessions#create"
  get "/sign-up", to: "users#new", as: "new_user"
  post "/sign-up", to: "users#create"
end
