require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation tests' do
  	it 'ensure name presence' do
  		product = Product.new(price: '100$', count: 10).save
  		expect(product).to eq(false)
  	end

  	it 'ensure price presence' do
  		product = Product.new(name: 'name', count: 10).save
  		expect(product).to eq(false)
  	end

  	it 'ensure count presence' do
  		product = Product.new(name: 'name', price: '100$').save
  		expect(product).to eq(false)
  	end
  end
end
