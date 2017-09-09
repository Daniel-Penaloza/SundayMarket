FactoryGirl.define do
  factory :description do
    name		["4k technology", "3 HDMI ports", "Smart tv"]
  end

  factory :description_long, class: "Description" do
  	name 		['Excellent Status 10 of 10', "The most coolest phone", "Liberated for any carrier"]
  end
end
