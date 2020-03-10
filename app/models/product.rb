class Product < ApplicationRecord
	has_many :orders
  	has_many :customers, through: :orders

  	validates_presence_of :name
	validates_presence_of :price
	validates_presence_of :count

	def more_than_zero?
		count > 0
	end
end
