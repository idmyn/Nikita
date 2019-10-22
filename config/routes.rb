Rails.application.routes.draw do
  resources :ideas
  resources :users
  # post "ideas/:id/pin", to: "ideas#new_pin", as: "new_pin"
  get "/log-in", to: "sessions#new", as: "new_session"
  post "/log-in", to: "sessions#create"
  delete "/log-out", to: "sessions#destroy", as: "delete_session"
end
