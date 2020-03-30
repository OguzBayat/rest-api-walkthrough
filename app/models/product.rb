class Product < ApplicationRecord
	has_many :orders
  	has_many :customers, through: :orders
  	validates_presence_of :name
	validates_presence_of :price
	validates_presence_of :count

	def more_than_zero?
		count > 0
	end

	def self.decrease_product_count product
		product.count-1
	end
end
