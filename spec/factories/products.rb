 FactoryGirl.define do
  factory :product do
  	name			    "Television samsung 30 inches 4k"
  	summary			  "The best tv in the market"
  	price 			  450.00

    factory :product_with_short_description do 
      after(:create) do |product|
        create(:description, :product => product)
      end
    end
  end

  factory :product_two , class: "Product" do
  	name			"Iphone 7 Plus"
  	summary			"Smartphone with the latest technology"
  	price			350.00
    
    factory :product_with_long_description do
      after(:create) do |product_two|
        create(:description_long, :product => product_two)
      end
    end
  end

end
