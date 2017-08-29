FactoryGirl.define do
  factory :product do
    name "MyString"
    price 15.00
    description ["MyString"]
    summary "MyText"
    /image "MyString"/
    category_id 1
    user_id 1
  end
end
