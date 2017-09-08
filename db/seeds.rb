# Mimic the process of taking a image and assigned to the user
@user_image = File.open(File.join(Rails.root,'app/assets/images/user_image.png'))

# Creation of a seller
@user = User.create!(first_name: "seller", last_name: "user", email: "selleruser@test.com", 
					phone: "0123456789", password: "asdfasdf", password_confirmation: "asdfasdf",
					image: @user_image)

puts "1 seller user has been created"

#Creation of a admin user
@admin_user = AdminUser.create!(first_name: "admin", last_name: "user", email: "adminuser@test.com", 
							   phone: "9876543210", password: "asdfasdf", password_confirmation: "asdfasdf",
							   image: @user_image)

puts "1 admin user has been created"


8.times do |seller|
	User.create!(first_name: "seller #{seller}", last_name: "user #{seller}", 
				 email: "seller#{seller}user#{seller}@test.com", password: "asdfasdf", 
				 password_confirmation: "asdfasdf", image: @user_image, phone: "(12#{seller} 456-789)")
end

puts "8 sellers have been created"


10.times do |category|
	Category.create(name: "number #{category} category", color: "#4CD762")
end

puts "10 categories are been created"


@product_image = File.open(File.join(Rails.root,'app/assets/images/product.jpg'))

Product.create!(name: "Game of thrones", price: 25.75, summary: "A nice show", 
				description: ["War", "Blood", "Politics","War", "Blood", "Politics"], 
				category_id: Category.first.id, user_id: @user.id,
				image: @product_image )


Product.create!(name: "Iphone 6", price: 350.99, summary: "An expensive phone", 
				description: ["The best phone ever made", "Latest technology", "Designed by apple"], 
				category_id: Category.second.id, user_id: @user.id,
				image: @product_image)

20.times do |product|
	Product.create!(name: "Cel #{product}", price: "380.50", summary: "This is a test phone",
					description: ["description number 1", "description number 2", "description number 3"],
					category_id: Category.second.id, user_id: @user.id, image: @product_image)
end


Product.create!(name: "Television", price: 450.50, summary: "A nice tv",
				description: ["52 inches", "LCD - 3D included", "1 month of warranty"],
				category_id: Category.third.id, user_id: @admin_user.id,
				image: @product_image)

puts "23 products have been created"