Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
  		resources :customers
  		get '/customers/:id/orders' => 'customers#orders'

  		post '/add_chart' => 'orders#add_chart'

  		post '/order_product' => 'orders#order_product'
  	end
  end
end
