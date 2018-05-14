class Restaurant < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :orders

  validates_presence_of :name, :image_url, :location, :min_price, :max_price
  validates_numericality_of :min_price, :max_price, length: { minimum: 4 }
  validates_uniqueness_of :name
end
