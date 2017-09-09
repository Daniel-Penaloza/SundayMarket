FactoryGirl.define do
	#We can create a different email for each user in the factories, this resolve the problem of uniquenesss
	
	sequence :email do |n|
		"user#{n}@test.com"
	end

	#Creation of our different users 
	#Note: (user has been trated as a seller)
	
	factory :user do
		first_name				"seller"
		last_name				"user"
		email					{ generate :email }
		password			  	"asdfasdf"
		password_confirmation 	"asdfasdf"
		shop_name               "sellers' shop"
		website                 "www.shopseller.com"
		shop_description        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
 														 Numquam debitis ex, veniam quos, facilis voluptatem excepturi 
														 reprehenderit id vitae veritatis omnis nostrum fuga eum harum, 
														 totam aliquam libero error quasi."
	end

	factory :admin_user, class: "AdminUser" do
		first_name				"admin"
		last_name				"user"
		email					{ generate :email }
		password 				"asdfasdf"
		password_confirmation	"asdfasdf"
	end

	factory :other_user, class: "User" do
		first_name				"other"
		last_name				"user"
		email					{ generate :email }
		password 				"asdfasdf"
		password_confirmation   "asdfasdf"
	end

end