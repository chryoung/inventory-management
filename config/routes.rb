Rails.application.routes.draw do
  resources :inventories
  resources :units
  resources :storages
  resources :prices
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "inventories#index"
end
