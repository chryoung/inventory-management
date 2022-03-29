Rails.application.routes.draw do
  resources :items
  post "items/create_and_continue", to: "items#create_and_continue"

  resources :products
  resources :consume_histories, only: [:new, :edit, :create, :update, :destroy]
  resources :inventories
  resources :units
  resources :storages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end
