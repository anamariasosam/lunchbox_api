class Order < ApplicationRecord
  belongs_to :menu_item
  belongs_to :restaurant, optional: true
  belongs_to :customer
  belongs_to :order_status

  validates_presence_of :quantity,
                        :menu_item_id,
                        :customer_id
  validates_numericality_of :quantity, greater_than: 0
end
