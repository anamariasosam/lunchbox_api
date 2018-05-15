class MenuItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :item_name, :description, :price, :image_url, :quantity, :restaurant_id

  attribute :restaurant_name do |object|
    object.restaurant.name
  end
end
