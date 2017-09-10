class Category < ApplicationRecord
	
	#-----------------------Associations-------------------#
		has_many :products, dependent: :destroy
		has_many :users, :through  => :products
	
	#-----------------------Validations-------------------#
   	COLOR_REGEX = /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/

    validates_presence_of :name
    validates :name, length: {minimum: 4, maximum: 15}
		validates_format_of :color, with: COLOR_REGEX
		validates :color, presence: true
		

	#----------------------- Uploader -----------------------#
  	mount_uploader :cat_image, CategoryImageUploader

  	#-----------------------Permalink-----------------------#
    extend FriendlyId
		friendly_id :name, use: :slugged
	
	

	
	#private
	#	def self.shuffle_images
	#		categories = Category.all
	#		selected_categories = categories.shuffle[0..2]
	#		categories_array = []
	#		selected_categories.each do |category|
	#			categories_array <<  category
	#		end
	#		categories_array
	#	end
end