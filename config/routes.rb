Rails.application.routes.draw do
  resources :items
  post "items/create_and_continue", to: "items#create_and_continue"
  post "items/create_with_default_product", to: "items#create_with_default_product"

  resources :inventories, shallow: true do
    resources :consume_histories, only: [:new, :edit, :create, :update, :destroy]
  end

  resources :products
  resources :units
  resources :storages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
end
