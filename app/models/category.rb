class Category < ApplicationRecord
	has_many :products
	has_many :users, :through  => :products
end
