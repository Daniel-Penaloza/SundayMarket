FactoryGirl.define do
  factory :product do
  	name			"Television samsung 30 inches 4k"
  	summary			"The best tv in the market"
  	price 			450.00
  	description		["4k technology", "3 HDMI ports", "Smart tv", "30 inches"]
  end

  factory :product_two , class: "Product" do
  	name			"Iphone 7 Plus"
  	summary			"Smartphone with the latest technology"
  	price			350.00
  	description		["Excellent condition", "3 months of warranty", "Liberated for any carrier"]
  end

end
