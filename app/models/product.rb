class Product < ApplicationRecord
	belongs_to :user
	belongs_to :category

	serialize :description, Array
	# user & category ID are both required through the belongs_to association
	# Description is an array and optional, with a 100 max chars per array item (which will be a line in a list item)
	
  	validates :name, presence:true, length: {minimum: 3, maximum: 240}
  	#validates :description, length: {minimum: 5, maximum: 50}
  	validates :price, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 5000 }
  	validates :summary, presence:true, length: {minimum: 4, maximum: 500}
  	default_scope -> { order(updated_at: :desc) }

  	mount_uploader :image, ProductImageUploader

  	extend FriendlyId
	friendly_id :name, use: :slugged
end