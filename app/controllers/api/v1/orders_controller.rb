class Api::V1::OrdersController < ApplicationController

	def add_chart
		customer = Customer.find(params[:customer_id])
		product = Product.find(params[:product_id])

		unless product.more_than_zero?
			return render error: { error: 'Ürün tükenmiş.'}, status: 400
		end

		@order = Order.new(customer: customer, product: product, status: false)
		if @order.save
			render json: @order
		else
			render error: { error: 'Ürünler sepete eklenemedi.'}, status: 400
		end
	end

	def order_product
		byebug
		customer = Customer.find(params[:customer_id])
		product = Product.find(params[:product_id])
		chart = Order.where(customer: customer, product: product, status: false)

		unless product.more_than_zero?
			return render error: { error: 'Ürün tükenmiş.'}, status: 400
		end

		chart.update(status: true)
		newCount = Product.decrease_product_count product
		
		if product.update(count: newCount)
			render json: product
		else
			render error: { error: 'Sipariş oluşturulamadı.'}, status: 400
		end
	end
end
