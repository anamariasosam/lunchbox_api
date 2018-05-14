class Order < ApplicationRecord
  belongs_to :menu_item
  belongs_to :customer
  belongs_to :order_status

  validates_presence_of :menu_item_id, :customer_id, :quantity
  validates_numericality_of :quantity
end
