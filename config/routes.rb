Rails.application.routes.draw do
  # get "session/create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  resources :registration,  only: [:index]
  post "signup", to: "registration#create"
  post "login", to: "session#create"
  post "/saveSearchTerm", to: "search#create"
  post "/saveBook", to: "saved_book#create"
  get "/savedBooks", to: "saved_book#index"
  get "/thumbsUpBooks", to: "liked_book#index"
  get "/thumbsDownBooks", to: "thumbs_down_book#index"

  delete "/savedBook/:isbn", to: "saved_book#destroy"
  delete "/thumbsUpBook/:isbn", to: "liked_book#destroy"
  post "/verify", to: "verification#create"
  post "/verify_code", to: "verification#verify"
  put "/update_pw", to: "registration#update"
  post "/likeBook", to: "liked_book#create"
  post "/thumbsDownBook", to: "thumbs_down_book#create"
end
