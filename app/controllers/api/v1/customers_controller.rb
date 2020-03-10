class Api::V1::CustomersController < ApplicationController

	def index
		@customers = Customer.all
		render json: @customers
	end

	def show
		@customer = Customer.find(params[:id])
		render json: @customer
	end

	def create
		@customer = Customer.new(customer_params)
		if @customer.save
			render json: @customer
		else
			render error: { error: 'Müşteri yaratılamadı.'}, status: 400
		end
	end

	def orders
		@customer = Customer.find(params[:id])
		@orders = @customer.products.where("orders.status = ?", true)
		render json: @orders
	end

	private

	def customer_params
		params.permit(:name, :surname, :email, :phone)
	end
end
