class Customer < ApplicationRecord
  has_many :orders

  validates_presence_of :name, :phone_number
  validates_uniqueness_of :phone_number
end
