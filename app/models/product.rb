class Product < ApplicationRecord
	scope :more_than_zero, -> { where("count > 0") }
	has_many :orders
  	has_many :customers, through: :orders

  	validates_presence_of :name
	validates_presence_of :price
	validates_presence_of :count
end
