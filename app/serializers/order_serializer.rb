class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :menu_item_id, :customer_id, :quantity, :order_status_id, :restaurant_id, :total
end
