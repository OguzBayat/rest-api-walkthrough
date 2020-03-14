5.times do
	Customer.create({
		name: Faker::Name.first_name,
		surname: Faker::Name.last_name,
		email: Faker::Internet.email,
		phone: Faker::PhoneNumber.cell_phone
	})
end

10.times do
	Product.create({
		name: Faker::Commerce.product_name,
		price: Faker::Commerce.price.to_s + "$",
		count: (rand 100)
	})
end