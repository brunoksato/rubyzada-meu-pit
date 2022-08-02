Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "beers#index"

  get "/beers", to: "beers#index"
  get "/beers/:id", to: "beers#show"
  post "/beers", to: "beers#create"
  patch "/beers/:id", to: "beers#update"
  delete "/beers/:id", to: "beers#destroy"
end
