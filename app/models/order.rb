class Order < ApplicationRecord
  belongs_to :menu_item
  belongs_to :customer
  belongs_to :order_status
end
