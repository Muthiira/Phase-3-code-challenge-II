# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
# user1 = User.create(name: Faker::Name.name)
# user2 = User.create(name: Faker::Name.name)
# user3 = User.create(name: Faker::Name.name)
5.times do
 User.create(name: Faker::Name.name)
end

puts "Creating products..."
5.times do
	Product.create(name: Faker::Name.name, price: rand(0..60))
end

puts "Creating reviews..."

5.times do 
	User.all.each do |user|
		Review.create(
			star_rating: rand(1..9),
			comment: Faker::Lorem.sentence,
			product_id: Product.all.pluck(:id).sample,
			user_id: user.id
		  )
	end
end

#Product.all.pluck(:id).sample,



# rand(1..5).times do
#     # get a random user for every review
#     # https://stackoverflow.com/a/25577054
#     user = User.order('RANDOM()').first


# puts "Creating products..."
# product1 = Product.create(name: "Stapler", price: 10)
# product2 = Product.create(name: "Whiteboard", price: 15)
# product3 = Product.create(name: "Dry Erase Markers", price: 5)
# product4 = Product.create(name: "Ballpoint Pens", price: 2)
# product5 = Product.create(name: "Scotch Tape", price: 3)
# # product = Product.create({
# # 	name: "name",
# # 	price: rand(0..60)
# # })
# Product.create(name: "Stapler", price: 10)
# Product.create(name: "Whiteboard", price: 15)
# Product.create(name: "Dry Erase Markers", price: 5)
# Product.create(name: "Ballpoint Pens", price: 2)
# Product.create(name: "Scotch Tape", price: 3)

# puts "Creating reviews..."
# # *****************************************************************
# # * TODO: create reviews! Remember, a review belongs to a product *
# # * and a review belongs to an user.                              *
# # *****************************************************************
# # Create Reviews Here
# Review.create(
# 	star_rating: rand(1..5),
# 	comment: Faker::Lorem.sentence,
# 	product_id: product.id,
# 	user_id: user.id
#   )
# end
puts "Seeding done!"