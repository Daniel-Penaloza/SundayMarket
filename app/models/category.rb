class Category < ApplicationRecord
	
	#-----------------------Associations-------------------#
	has_many :products, dependent: :destroy
	has_many :users, :through  => :products
	
	#-----------------------Validations-------------------#
    validates_presence_of :name
	
	#----------------------- Uploader -----------------------#
  	mount_uploader :cat_image, CategoryImageUploader

  	#-----------------------Permalink-----------------------#
    extend FriendlyId
	friendly_id :name, use: :slugged
end