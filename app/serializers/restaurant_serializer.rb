class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :location, :min_price, :max_price
end
