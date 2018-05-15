class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :image_url, :location, :min_price, :max_price
  set_type :restaurant
  has_many :menu_items
end
