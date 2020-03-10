require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

	context 'GET #index' do
		it 'returns a success response' do
			get :index
			expect(response).to have_http_status(200)
		end
	end

	context 'GET #show' do
		it 'returns a success response' do
			customer = Customer.create!(name: 'name', surname: 'surname', email: 'asdf@asdf.com', phone: '1234456')
			get :show, params: { id: customer.to_param }
			expect(response).to have_http_status(200)
		end
	end

end
