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
		phone					"0123456789"
	end

	factory :admin_user, class: "AdminUser" do
		first_name				"admin"
		last_name				"user"
		email					{ generate :email }
		password 				"asdfasdf"
		password_confirmation	"asdfasdf"
		phone					"987654321"
	end

	factory :other_user, class: "User" do
		first_name				"other"
		last_name				"user"
		email					{ generate :email }
		password 				"asdfasdf"
		password_confirmation   "asdfasdf"
		phone					"1234567890"
	end

end