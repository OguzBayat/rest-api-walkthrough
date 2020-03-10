class Customer < ApplicationRecord
	has_many :orders
  	has_many :products, through: :orders

	validates_presence_of :name
	validates_presence_of :surname
	validates_presence_of :email
	validates_presence_of :phone
end
