Rails.application.routes.draw do
  namespace :v1 do
    resources :order_statuses
    resources :menu_items, only: [:show, :index]

    resources :customers do
      resources :orders, controller: 'customer_orders'
    end

    resources :restaurants do
      resources :menu_items, controller: 'restaurant_menu_items'
      resources :orders, controller: 'restaurant_orders'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
