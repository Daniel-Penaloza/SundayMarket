# Mimic the process of taking a image and assigned to the user
@user_image = File.open(File.join(Rails.root,'app/assets/images/user_image.png'))

# Creation of a seller
@user = User.create!(first_name: "seller", last_name: "user", email: "selleruser@test.com", 
					password: "asdfasdf", password_confirmation: "asdfasdf",
					image: @user_image, website: "test.test", shop_name: "User's Shop")

puts "1 seller user has been created"

#Creation of a admin user
@admin_user = AdminUser.create!(first_name: "admin", last_name: "user", email: "adminuser@test.com", 
							   password: "asdfasdf", password_confirmation: "asdfasdf", shop_name: "Admin's shop",
							   image: @user_image)

puts "1 admin user has been created"


8.times do |seller|
	User.create!(first_name: "seller #{seller}", last_name: "user #{seller}", 
				 email: "seller#{seller}user#{seller}@test.com", password: "asdfasdf", 
				 password_confirmation: "asdfasdf", image: @user_image, shop_name: "Seller #{seller} Shop")
end

puts "8 sellers have been created"


10.times do |category|
	Category.create(name: "Category #{category} ", color: "#4CD762")
end

puts "10 categories are been created"


@product_image = File.open(File.join(Rails.root,'app/assets/images/product_image.jpg'))



20.times do |product|
	Product.create!(name: "Cel #{product}", price: "380.50", summary: "This is a test phone",
					category_id: Category.second.id, user_id: @user.id, image: @product_image)
end


puts "23 products have been created"