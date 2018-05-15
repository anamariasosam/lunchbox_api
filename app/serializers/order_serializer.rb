class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :menu_item_id, :customer_id, :quantity, :order_status_id, :restaurant_id, :total

  attribute :menu_item_name do |object|
    object.menu_item.item_name
  end

  attribute :customer_name do |object|
    object.customer.name
  end

  attribute :restaurant_name do |object|
    object.restaurant.name
  end

  attribute :order_status_description do |object|
    object.order_status.description
  end
end
