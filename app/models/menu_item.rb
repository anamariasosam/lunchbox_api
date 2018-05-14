class MenuItem < ApplicationRecord
  belongs_to :restaurant, touch: true

  validates_presence_of :item_name, :description, :price, :quantity, :image_url, :restaurant_id
  validates_numericality_of :price, length: { minimum: 4 }
  validates_numericality_of :quantity, greater_than: 0
  validates_length_of :description, maximum: 500
  validates_length_of :item_name, maximum: 40
  validates_uniqueness_of :item_name, scope: :restaurant_id

  before_update :item_quantity

  private
    def item_quantity
      if self.quantity < 0
        self.quantity = 0
      end
    end
end
