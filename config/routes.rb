Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :products
      resources :orders
      resources :order_items
    end
  end
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end