FactoryGirl.define do
	#We can create a different email for each user in the factories, this resolve the problem of uniquenesss
	
	sequence :email do |n|
		"user#{n}@test.com"
	end

	#Creation of our different users 
	#Note: (user has been trated as a seller)
	
	factory :user do
		email					{ generate :email }
		first_name				"seller"
		last_name				"usershop"
		password			  	"asdfasdf"
		password_confirmation 	"asdfasdf"
		shop_name				"sellers' shop"
		website					"www.shopseller.com"
		shop_description		"Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
								 Numquam debitis ex, veniam quos, facilis voluptatem excepturi 
								 reprehenderit id vitae veritatis omnis nostrum fuga eum harum, 
								 totam aliquam libero error quasi."
	end

	factory :admin_user, class: "AdminUser" do
		email					{ generate :email }
		first_name				"admin"
		last_name				"usershop"
		password 				"asdfasdf"
		password_confirmation	"asdfasdf"
		shop_name				"admin's shop"
		website					"www.shopadmin.com"
		shop_description   		"Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
								 Numquam debitis ex, veniam quos, facilis voluptatem excepturi 
								 reprehenderit id vitae veritatis omnis nostrum fuga eum harum, 
								 totam aliquam libero error quasi."
	end

	factory :other_user, class: "User" do
		email					{ generate :email }
		first_name				"other"
		last_name				"usershop"
		password 				"asdfasdf"
		password_confirmation   "asdfasdf"
		shop_name				"other's shop"
		website					"www.shopother.com"
		shop_description        "Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
								 Numquam debitis ex, veniam quos, facilis voluptatem excepturi 
								 reprehenderit id vitae veritatis omnis nostrum fuga eum harum, 
								 totam aliquam libero error quasi."
	end

	factory :banned_user, class: "User" do
		email					{ generate :email }
		first_name				"seller"
		last_name				"usershop"
		password			  	"asdfasdf"
		password_confirmation 	"asdfasdf"
		shop_name				"sellers' shop"
		website					"www.shopseller.com"
		shop_description		"Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
								 Numquam debitis ex, veniam quos, facilis voluptatem excepturi 
								 reprehenderit id vitae veritatis omnis nostrum fuga eum harum, 
								 totam aliquam libero error quasi."
		ban						true
	end
end