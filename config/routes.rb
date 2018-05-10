Rails.application.routes.draw do
  resources :orders
  resources :order_statuses
  resources :customers
  resources :menu_items
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
