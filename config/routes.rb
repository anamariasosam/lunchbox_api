Rails.application.routes.draw do
  namespace :v1 do
    resources :orders
    resources :order_statuses
    resources :customers
    resources :menu_items, only: [:show, :index]

    resources :restaurants do
      resources :menu_items, controller: 'restaurant_menu_items'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
