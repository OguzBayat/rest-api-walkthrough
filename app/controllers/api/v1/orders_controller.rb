class Api::V1::OrdersController < ApplicationController

	def add_chart
		customer = Customer.find(params[:customer_id])
		product = Product.find(params[:product_id])

		unless product.more_than_zero?
			return render json: {status: "error", code: 400, message: "Ürün tükenmişasdas."}
		end

		@order = Order.new(customer: customer, product: product, status: false)
		if @order.save
			render json: { messages: 'Ürünler başarıyla sepete eklendi.' }, status: 200
		else
			render json: {status: "error", code: 400, message: "Ürün sepete eklenemedi.."}
		end
	end

	def order_product
		customer = Customer.find(params[:customer_id])
		product = Product.find(params[:product_id])
		chart = Order.where(customer: customer, product: product, status: false)
		
		unless product.more_than_zero?
			Order.destroy(chart.ids.first) if chart.ids.first.present?
			return render json: {status: "error", code: 400, message: "Ürün tükenmiş."}
		end

		if chart.present?
			chart.update(status: true)
			newCount = Product.decrease_product_count product
		
			if product.update(count: newCount)
				render json: { messages: 'Sipariş başarıyla oluşturuldu.' }, status: 200
			else
				render json: {status: "error", code: 400, message: "Sipariş oluşturulamadı."}
			end
		else
			render json: {status: "error", code: 400, message: "Sipariş oluşmadı, öncelikle ürünü sepete eklemelisiniz."}
		end
	end
end
