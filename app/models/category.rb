class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	has_many :users, :through  => :products
	
	#add validations, uniqueness, ? think about what else
	
  mount_uploader :cat_image, CategoryImageUploader
    validates_presence_of :name

end