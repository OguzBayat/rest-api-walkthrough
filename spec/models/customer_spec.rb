require 'rails_helper'

RSpec.describe Customer, type: :model do
  context 'validation tests' do 
  	it 'ensure name presence' do
  		customer = Customer.new(surname: 'surname', email: 'asdf@asdf.com', phone: '1234456').save
  		expect(customer).to eq(false)
  	end

  	it 'ensure surname presence' do
  		customer = Customer.new(name: 'name', email: 'asdf@asdf.com', phone: '1234456').save
  		expect(customer).to eq(false)
  	end

  	it 'ensure email presence' do
  		customer = Customer.new(name: 'name', surname: 'surname', phone: '1234456').save
  		expect(customer).to eq(false)
  	end

  	it 'ensure phone presence' do
  		customer = Customer.new(name: 'name', surname: 'surname', email: 'asdf@asdf.com').save
  		expect(customer).to eq(false)
  	end
  end
end
